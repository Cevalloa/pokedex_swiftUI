//
//  PokemonDetailViewModel.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/12/26.
//

import SwiftUI

@MainActor
@Observable
final class PokemonDetailViewModel {
    var imageURL: URL?
    var isLoading = false
    var errorMessage: String?
    
    private let apiClient = PokemonAPIClient()
    
    func loadDetail(for pokemon: Pokemon) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let detailResponse = try await apiClient.fetchPokemonDetail(from: pokemon.url)
            
            if let imageURLString = detailResponse.sprites.frontDefault {
                imageURL = URL(string: imageURLString)
            }
        } catch {
            errorMessage = "Failed to load pokemon details"
        }
        
        isLoading = false
    }
}
