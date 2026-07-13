//
//  Untitled.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    @State private var viewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            
            if viewModel.isLoading {
                ProgressView("loading image")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            } else if let imageUrl = viewModel.imageURL {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                } placeholder: {
                    ProgressView()
                }
            } else {
                Text("No image available")
                    .foregroundStyle(.secondary)
            }
            
            Text(pokemon.name)
                .font(.largeTitle)
                .bold()
            
            Text("Type: \(pokemon.url)")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
        .navigationTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadDetail(for: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
}
