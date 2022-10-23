//
//  PokemonCell.swift
//  student648539
//
//  Created by Guido van Dijk on 10/10/2022.
//
import SwiftUI

struct PokemonCell: View {
    var pokemon: Pokemon
    
    func addZerosTo(pokemonId id:Int) -> String {
        return String(format: "%03d", id)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                AsyncImage(url: URL(string: pokemon.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .background(Color(red: 0.965, green: 0.964, blue: 1.0))
                            .cornerRadius(10.0, corners: [.topLeft, .topRight])
                    } else if phase.error != nil {
                        Image("missing_pokemon_fallback")
                            .resizable()
                            .scaledToFit()
                            .padding(.all, 20)
                    } else {
                        ProgressView()
                    }
                }.frame(minHeight: 160)

                ZStack(alignment: .topLeading) {
                    Color.clear
                    Text(String.formatZeros(for: pokemon.id))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10.0)
                        .padding(.vertical, 5.0)
                        .background(Color(red: 0.335, green: 0.194, blue: 0.909))
                        .cornerRadius(5.0)
                }
                .padding([.leading], 10.0)
                .padding([.top], 10.0)
            }
            VStack(alignment: .center) {                
                Text(pokemon.name.capitalized)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.top, 5.0)
                    .padding(.bottom, 10.0)
            }
            .padding(.horizontal, 10.0)
        }
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: Color(0x303773, alpha: 0.15), radius: 5, x: 0, y: 2)
    }
}


var testPokemon:Pokemon = Pokemon(url: "https://pokeapi.co/api/v2/pokemon/1/", name: "bulbasaur")
let testGrid = [GridItem(.adaptive(minimum: 170), spacing: 20)]

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: testGrid){
            PokemonCell(pokemon: testPokemon)
            PokemonCell(pokemon: testPokemon)
        }.padding()
    }
}
