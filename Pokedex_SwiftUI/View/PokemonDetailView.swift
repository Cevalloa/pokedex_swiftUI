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
            
            Text("Type: \(pokemon.type)")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(id: 25, name: "Pikachu", type: "Electric"))
}
