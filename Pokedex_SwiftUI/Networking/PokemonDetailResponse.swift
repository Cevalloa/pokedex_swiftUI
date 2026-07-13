//
//  PokemonDetailResponse.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/11/26.
//

struct PokemonDetailResponse: Decodable {
    let id: Int
    let sprites: PokemonSprites
    let types: [PokemonTypeSlot]
}

struct PokemonSprites: Decodable {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonTypeSlot: Decodable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Decodable {
    let name: String
    let url: String
}
