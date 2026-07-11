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
        Pokemon(
            name: "bulbasaur",
            url: "https://pokeapi.co/api/v2/pokemon/1/"
        ),
        Pokemon(
            name: "charmander",
            url: "https://pokeapi.co/api/v2/pokemon/4/"
        ),
        Pokemon(
            name: "squirtle",
            url: "https://pokeapi.co/api/v2/pokemon/7/"
        ),
        Pokemon(
            name: "pikachu",
            url: "https://pokeapi.co/api/v2/pokemon/25/"
        ),
    ]
}
