//
//  Untitled.swift
//  Pokedex_SwiftUI
//
//  Created by Alex Cevallos on 7/13/26.
//

import Foundation
import Testing
@testable import Pokedex_SwiftUI

struct PokemonDetailResponseTests {
    
    @Test
    @MainActor
    func decodesPokemonDetailResponse() throws {
        let json = """
            {
                      "id": 25,
                      "sprites": {
                        "front_default": "https://example.com/pikachu.png"
                      },
                      "types": [
                        {
                          "slot": 1,
                          "type": {
                            "name": "electric",
                            "url": "https://pokeapi.co/api/v2/type/13/"
                          }
                        }
                      ]
                    }
            """
        let data = Data(json.utf8)
        
        let response = try JSONDecoder().decode(
            PokemonDetailResponse.self,
            from: data
        )
        
        #expect(response.id == 25)
        #expect(response.sprites.frontDefault == "https://example.com/pikachu.png")
        #expect(response.types.count == 1)
        
        let firstType = try #require(response.types.first)

        #expect(firstType.slot == 1)
        #expect(firstType.type.name == "electric")
        #expect(firstType.type.url == "https://pokeapi.co/api/v2/type/13/")
    }
}
