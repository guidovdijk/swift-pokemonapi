//
//  PokemonFavourite.swift
//  student648539
//
//  Created by Guido van Dijk on 15/10/2022.
//

import Foundation

class PokemonFavourite: ObservableObject {
    @Published
    var pokemons: [Pokemon] = []
    
    func isInListBy(_ pokemon:Pokemon) -> Bool {
        return pokemons.contains( where: { $0.id == pokemon.id })
    }
    
    func removeFromFavourite(_ pokemon:Pokemon) {
        pokemons = pokemons.filter { $0.id != pokemon.id }
    }
    
    func addToFavourites(_ pokemon: Pokemon){
        pokemons.append(pokemon)
    }
}
