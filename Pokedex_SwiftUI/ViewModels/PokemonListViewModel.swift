//
//  PokemonListViewModel.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import SwiftUI

@Observable
final class PokemonListViewModel {
    var pokemon: [Pokemon] = [
        Pokemon(id: 1, name: "Bulbasaur", type: "Grass"),
        Pokemon(id: 4, name: "Charmander", type: "Fire"),
        Pokemon(id: 7, name: "Squirtle", type: "Water"),
        Pokemon(id: 25, name: "Pikachu", type: "Electric")
    ]
}
