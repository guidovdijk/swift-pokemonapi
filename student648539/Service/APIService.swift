//
//  APIService.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

struct APIService {
    private let url:String = "https://pokeapi.co/api/v2"
    
    public func fetchPokemons() async throws -> PokemonResultWrapper {
        let baseUrl = "\(url)/pokemon?limit=151"
        
        return try await URLSession.fetch(from: baseUrl)
    }
    
    public func fetchPokemonBy(id:Int) async throws -> PokemonDetail {
        let baseUrl = "\(url)/pokemon/\(id)"

        return try await URLSession.fetch(from: baseUrl)
    }
    
    public func fetchPokemonSpecies(id:Int) async throws -> PokemonSpeciesWrapper {
        let baseUrl = "\(url)/pokemon-species/\(id)"

        return try await URLSession.fetch(from: baseUrl)
    }
    
    public func fetchPokemonEvolutionsBy(id:Int) async throws -> PokemonEvolutionChain {
        let baseUrl = "\(url)/evolution-chain/\(id)"

        return try await URLSession.fetch(from: baseUrl)
    }
}
