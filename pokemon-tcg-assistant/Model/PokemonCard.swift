//
//  File.swift
//  pokemon-tcg-assistant
//
//  Created by Gabriel Santiago on 16/02/23.
//

import Foundation

struct PokemonCard: Codable {
    var name: String
    var hp: String
    var images: Images
}

struct Images: Codable {
    var large,small: String
}

struct CardsData: Codable {
    var data: [PokemonCard]
}
