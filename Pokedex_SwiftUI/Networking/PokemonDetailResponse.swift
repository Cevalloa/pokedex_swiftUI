//
//  PokemonDetailResponse.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/11/26.
//

struct PokemonDetailResponse: Decodable {
    let sprites: PokemonSprites
}

struct PokemonSprites: Decodable {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
