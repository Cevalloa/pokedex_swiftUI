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
                    
                    List {
                        ForEach(viewModel.filteredPokemon) { pokemon in
                            NavigationLink {
                                PokemonDetailView(pokemon: pokemon)
                            } label: {
                                PokemonRowView(pokemon: pokemon)
                            }
                            
                            .task {
                                await viewModel.loadMorePokemonIfNeeded(currentPokemon: pokemon)
                            }
                        }
                        
                        if viewModel.isLoadingMore {
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                        }
                    }
                    
//                    List(viewModel.filteredPokemon) { pokemon in
//                        NavigationLink {
//                            PokemonDetailView(pokemon: pokemon)
//                        } label: {
//                            PokemonRowView(pokemon: pokemon)
//                        }
//                    }
                }
            }.navigationTitle("Pokedex")
                .searchable(text: $viewModel.searchText, prompt: "Search Pokemon")
        }.task {
            await viewModel.loadPokemon()
        }
    }
}

#Preview {
    ContentView()
}
