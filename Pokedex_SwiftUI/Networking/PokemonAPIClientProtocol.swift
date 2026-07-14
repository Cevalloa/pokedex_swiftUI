//
//  PokemonAPIClientProtocol.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/14/26.
//

protocol PokemonAPIClientProtocol {
    func fetchPokemonList() async throws -> [Pokemon]
    func fetchPokemonDetail(from urlString: String) async throws -> PokemonDetailResponse
}
