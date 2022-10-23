//
//  PokemonStats.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct PokemonStats: Decodable {
    let baseStat:Int
    let stat: PokemonStatName
    
    enum CodingKeys: String, CodingKey  {
        case baseStat = "base_stat"
        case stat = "stat"
    }
}

struct PokemonStatName: Decodable, Hashable {
    let name: String
    
    enum CodingKeys: String, CodingKey  {
        case name = "name"
    }
}
