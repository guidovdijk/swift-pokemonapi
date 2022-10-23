//
//  PokemonDetail.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let baseExp: Int
    let weight: Int
    let height: Int
    let types: [PokemonTypeWrapper]?
    let abilities: [PokemonAbilityWrapper]?
    let stats: [PokemonStats]?
    var evolutions: PokemonEvolutionChain? = nil
    
    var image: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case baseExp = "base_experience"
        case weight = "weight"
        case height = "height"
        case types = "types"
        case abilities = "abilities"
        case stats = "stats"
    }
}
