//
//  PokemonEvolutions.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct PokemonEvolutionChain: Decodable {
    let id: Int?
    let chain: PokemonEvolvesTo?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case chain = "chain"
    }
}


struct PokemonEvolvesTo: Decodable {
    let pokemon: Pokemon
    let evolvesTo: [PokemonEvolvesTo]?
    
    enum CodingKeys: String, CodingKey {
        case pokemon = "species"
        case evolvesTo = "evolves_to"
    }
}
