//
//  Pokemon.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

struct Pokemon: Identifiable, Decodable {
    let name: String
    let url: String
    
    var id: String {
        url
    }
}
