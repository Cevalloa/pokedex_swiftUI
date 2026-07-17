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

struct PokemonAPIClient: PokemonAPIClientProtocol {
    func fetchPokemonList(limit: Int, offset: Int) async throws -> PokemonListResponse {
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
        
        return try JSONDecoder().decode(
            PokemonListResponse.self,
            from: data
        )
    }
    
    func fetchPokemonDetail(from urlString: String) async throws -> PokemonDetailResponse {
        guard let url = URL(string: urlString) else {
            throw PokemonAPIClientError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PokemonAPIClientError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw PokemonAPIClientError.badStatusCode(httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
    }
}
