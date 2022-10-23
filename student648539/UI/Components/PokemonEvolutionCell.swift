//
//  PokemonEvolutionCell.swift
//  inhollandExercise
//
//  Created by Guido van Dijk on 13/10/2022.
//

import Foundation
import SwiftUI


struct PokemonEvolutionCell: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: pokemon.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .background(Color(red: 0.965, green: 0.964, blue: 1.0))
                        .cornerRadius(10.0, corners: [.topLeft, .bottomLeft])
                        
                } else if phase.error != nil {
                    Image("missing_pokemon_fallback")
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }.frame(width: 100, height: 100)
            

            
            VStack(alignment: .leading) {
                
                Text(String.formatZeros(for: pokemon.id))
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 5.0)
                    .background(Color(red: 0.335, green: 0.194, blue: 0.909))
                    .cornerRadius(5.0)
                
                Text(pokemon.name.capitalized)
                    .font(.body)
                    .fontWeight(.medium)
            }
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color(0x303773, alpha: 0.15), radius: 5, x: 0, y: 2)
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 12,
                             leading: 0,
                             bottom: 12,
                             trailing: 0)
        )
        .listRowBackground(Color.clear)
    }
}


var testPokemon2:[Pokemon] = [
    Pokemon(url: "https://pokeapi.co/api/v2/pokemon/1/", name: "bulbasaur"),
    Pokemon(url: "https://pokeapi.co/api/v2/pokemon/1/", name: "bulbasaur")
]

struct PokemonEvolutionCell_Previews: PreviewProvider {
    static var previews: some View {
        List(testPokemon2, id: \.name) { pokemon in
            PokemonEvolutionCell(pokemon: pokemon)
            //                .listSectionSeparator(.hidden, edges: .all)

        }
    }
}
