//
//  PokemonAPIClient.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/10/26.
//

import Foundation

enum PokemonAPIClientError: Error {
    case invalidURL
    case invalidResponse
    case badStatusCode(Int)
}

struct PokemonAPIClient {
    func fetchPokemonList() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {
            throw PokemonAPIClientError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonAPIClientError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw PokemonAPIClientError.badStatusCode(httpResponse.statusCode)
        }
        
        let pokemonListResponse = try JSONDecoder().decode(
            PokemonListResponse.self,
            from: data
        )
        
        return pokemonListResponse.results
    }
}
