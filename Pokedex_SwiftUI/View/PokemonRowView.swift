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
        
        HStack(spacing: 12) {
            if let spriteURL = pokemon.spriteURL {
                AsyncImage(url: spriteURL) {image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                } placeholder: {
                    ProgressView()
                        .frame(width: 56, height: 56)
                }
            } else {
                Image(systemName:"questionmark.circle")
                    .frame(width:56, height:56)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pokemon.name.capitalized)
                    .font(.headline)

                Text(pokemon.url)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 4)
        }
       
    }
}

#Preview {
    PokemonRowView(pokemon: Pokemon(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
}
