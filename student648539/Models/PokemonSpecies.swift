//
//  PokemonSpecies.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation


struct PokemonSpeciesWrapper: Decodable {
    let evolutionChain:PokemonSpecies
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
    }
}


struct PokemonSpecies: Decodable {
    let url:String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}
