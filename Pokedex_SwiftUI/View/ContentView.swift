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
            List(viewModel.pokemon) { pokemon in
                Text(pokemon.name)
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    ContentView()
}
