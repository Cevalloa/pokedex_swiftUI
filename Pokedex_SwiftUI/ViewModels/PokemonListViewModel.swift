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
    
    var isLoadingMore = false
    var loadMoreErrorMessage: String?
    
    private let apiClient: any PokemonAPIClientProtocol
    
    private let pageLimit = 20
    private var offset = 0
    private var canLoadMorePages = true
    
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
        guard pokemon.isEmpty else {
            return
        }
        
        await loadNextPage(isInitialLoad: true)
    }
    
    func loadMorePokemonIfNeeded(currentPokemon: Pokemon) async {
        guard searchText.isEmpty else {
            return
        }
        
        guard let lastPokemon = pokemon.last else {
            return
        }
        
        guard currentPokemon.id == lastPokemon.id else {
            return
        }
        
        await loadNextPage(isInitialLoad: false)
    }
    
    func loadNextPage(isInitialLoad: Bool) async {
        guard canLoadMorePages else {
            return
        }
        
        guard !isLoading && !isLoadingMore else {
            return
        }
        
        if isInitialLoad {
            isLoading = true
            errorMessage = nil
        } else {
            isLoadingMore = true
            loadMoreErrorMessage = nil
        }
        
        do {
            let response = try await apiClient.fetchPokemonList(
                limit: pageLimit,
                offset: offset
            )
            
            pokemon.append(contentsOf: response.results)
            offset += response.results.count
            canLoadMorePages = response.next != nil && !response.results.isEmpty
        } catch {
            if isInitialLoad {
                errorMessage = "Failed to load Pokémon."
            } else {
                loadMoreErrorMessage = "Failed to load more Pokémon."
            }
        }
        
        isLoading = false
        isLoadingMore = false
    }
}
