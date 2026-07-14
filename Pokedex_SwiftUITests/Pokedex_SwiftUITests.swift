//
//  Pokedex_SwiftUITests.swift
//  Pokedex_SwiftUITests
//
//  Created by Alex Cevallos on 7/10/26.
//

import Testing

@testable import Pokedex_SwiftUI

struct Pokedex_SwiftUITests {

    @Test
    @MainActor
    func startswithMockedPokemon() {
        let viewModel = PokemonListViewModel()

        #expect(viewModel.pokemon.isEmpty)
        #expect(viewModel.isLoading == false)
    }
    
    @Test
    @MainActor
    func loadPokemonUpdatesPokemonList() async {
        let mockClient = MockPokemonAPIClient(
            pokemonList: [Pokemon(name:"pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")]
        )
        
        let viewModel = PokemonListViewModel(apiClient: mockClient)
        
        await viewModel.loadPokemon()
        
        #expect(viewModel.pokemon.count == 1)
        #expect(viewModel.pokemon.first?.name == "pikachu")
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage == nil)
    }
}

struct MockPokemonAPIClient: PokemonAPIClientProtocol {
    let pokemonList: [Pokemon]

    func fetchPokemonList() async throws -> [Pokemon] {
        pokemonList
    }

    func fetchPokemonDetail(from urlString: String) async throws
        -> PokemonDetailResponse
    {
        PokemonDetailResponse(
            id: 25,
            sprites: PokemonSprites(
                frontDefault: "https://example.com/pikachu.png"
            ),
            types: []
        )
    }
}
