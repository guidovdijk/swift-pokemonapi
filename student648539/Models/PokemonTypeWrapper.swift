//
//  PokemonType.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct PokemonTypeWrapper: Decodable {
    let slot: Int?

    let type: PokemonType?
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}

struct PokemonType: Decodable, Hashable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
