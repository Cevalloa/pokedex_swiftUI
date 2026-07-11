//
//  PokemonListViewModel.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import SwiftUI

@MainActor
@Observable
final class PokemonListViewModel {
    var pokemon: [Pokemon] = []
    var isLoading = false
    var errorMessage: String?
    
    private let apiClient: PokemonAPIClient
    
    init(apiClient: PokemonAPIClient) {
        self.apiClient = apiClient
    }
    
    init() {
        self.apiClient = PokemonAPIClient()
    }
    
    func loadPokemon() async {
        isLoading = true
        errorMessage = nil
        
        do {
            pokemon = try await apiClient.fetchPokemonList()
        } catch {
            errorMessage = "Failed to load pokemon"
        }
        
        isLoading = false
    }
}
