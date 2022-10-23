//
//  Pokemon.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//
import Foundation


struct Pokemon: Decodable, Hashable {
    let url: String
    let name: String

    var id: Int {
        let strId = URL(fileURLWithPath: url).lastPathComponent
        return Int(strId) ?? 0
    }
    
    var image: String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case name = "name"
    }
}
