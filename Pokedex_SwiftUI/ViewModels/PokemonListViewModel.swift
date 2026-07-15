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
    var searchText = ""
    
    private let apiClient: any PokemonAPIClientProtocol
    
    init(apiClient: any PokemonAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    init() {
        self.apiClient = PokemonAPIClient()
    }
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemon
        }
        
        return pokemon.filter { pokemon in
            pokemon.name.localizedCaseInsensitiveContains(searchText)
        }
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
