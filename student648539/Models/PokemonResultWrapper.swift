//
//  PokemonResultWrapper.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct PokemonResultWrapper: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}
