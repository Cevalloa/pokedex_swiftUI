//
//  ContentView.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Pokemon..")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                } else {
                    List(viewModel.pokemon) { pokemon in
                        NavigationLink {
                            PokemonDetailView(pokemon: pokemon)
                        } label: {
                            Text(pokemon.name)
                        }
                    }
                }
            }.navigationTitle("Pokedex")
        }.task {
            await viewModel.loadPokemon()
        }
    }
}

#Preview {
    ContentView()
}
