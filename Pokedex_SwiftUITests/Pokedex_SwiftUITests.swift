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
}
