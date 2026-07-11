//
//  PokemonRowView.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/11/26.
//

import SwiftUI

struct PokemonRowView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(pokemon.name.capitalized)
                .font(.headline)

            Text(pokemon.url)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(4)
    }
}

#Preview {
    PokemonRowView(pokemon: Pokemon(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
}
