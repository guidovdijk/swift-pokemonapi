//
//  PokemonAbility.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct PokemonAbilityWrapper: Decodable {
    let slot: Int
    let is_hidden: Bool
    let ability: PokemonAbility
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case is_hidden = "is_hidden"
        case ability = "ability"
    }
}


struct PokemonAbility: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
