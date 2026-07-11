//
//  Untitled.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: 16) {
            Text(pokemon.name)
                .font(.largeTitle)
                .bold()
            
            Text("Type: \(pokemon.url)")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
}
