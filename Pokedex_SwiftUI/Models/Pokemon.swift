//
//  Pokemon.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import Foundation

struct Pokemon: Identifiable, Decodable {
    let name: String
    let url: String
    
    var id: String {
        url
    }
    
    var pokemonID: String? {
        guard let detailURL = URL(string: url) else {
            return nil
        }
        
        return detailURL.pathComponents.last
    }
    
    var spriteURL: URL? {
        guard let pokemonID else {
            return nil
        }
        
        return URL(
            string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
            )
    }
}
