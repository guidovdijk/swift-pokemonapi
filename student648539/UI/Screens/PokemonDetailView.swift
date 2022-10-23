//
//  PokemonDetailView.swift
//  inhollandExercise
//
//  Created by Guido van Dijk on 11/10/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject
    var favourites: PokemonFavourite
    
    @State private var didAppear: Bool = false
    @State private var activeSelection:Int = 2
    @State private var pokemonDetail: PokemonDetail?
    @State private var pokemonEvolutions: [Pokemon] = []
    @State private var error: Error? = nil

    let pokemon: Pokemon
    
    private func createPokemonEvolutionArray(){
        var evoData = pokemonDetail?.evolutions?.chain;
        var isDone = false;
        
        while(isDone == false){
            let evoDetails = evoData?.pokemon
            
            pokemonEvolutions.append(evoDetails!)
            
            evoData = {
                if(evoData?.evolvesTo?.count ?? 0 > 0){
                    return evoData?.evolvesTo?[0]
                } else {
                    return nil
                }
            }()
            
            if(evoData == nil){
                isDone = true
            }
        }
    }
    
    func fetchPokemon() async {
        do {
            let APIService = APIService()
            async let detailRes = try await APIService.fetchPokemonBy(id: pokemon.id)
            async let pokemonSpecies = try await APIService.fetchPokemonSpecies(id: pokemon.id)
            
            pokemonDetail = try await detailRes
            let speciesUrl = try await pokemonSpecies.evolutionChain.url
            
            let chainId = Int(URL(fileURLWithPath: speciesUrl).lastPathComponent) ?? 0
            pokemonDetail?.evolutions = try await APIService.fetchPokemonEvolutionsBy(id: chainId)
            
            createPokemonEvolutionArray()
            self.error = nil
        } catch {
            print(error)
            self.error = error
        }
    }
    
    init(pokemon:Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Text(String.formatZerosAndHastag(for: pokemon.id))
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color(0x0E0940).opacity(0.3))
                }
                HStack {
                    let types = pokemonDetail?.types ?? []
                    
                    ForEach(types, id: \.type) { type in
                        PokemonTypeBadge(type: type.type!.name)
                    }
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(0xEDF6FF))
            
            VStack {
                ZStack {
                    VStack(spacing: 0) {
                        Color(0xEDF6FF)
                        Color.clear.frame(height: 80)
                    }.offset(y: -10)
                    
                    AsyncImage(url: URL(string: pokemon.image)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("missing_pokemon_fallback")
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                    }.frame(idealWidth: 200, maxWidth: 300, minHeight: 100, maxHeight: 200)
                }
            }
            
            VStack(alignment: .leading) {
                if(pokemonDetail != nil) {
                    HStack {
                        Button(
                            action: { activeSelection = 1 },
                            label: { Text("About") }
                        )
                        .buttonStyle(BorderedProminentButtonStyle())
                        .disabled(activeSelection == 1)
                        
                        Spacer()
                        
                        Button(
                            action: { activeSelection = 2 },
                            label: { Text("Stats") }
                        )
                        .buttonStyle(BorderedProminentButtonStyle())
                        .disabled(activeSelection == 2)
                        
                        Spacer()
                        Button(
                            action: { activeSelection = 3 },
                            label: {
                                Text("Evolutions")
                            }
                        )
                        .buttonStyle(BorderedProminentButtonStyle())
                        .disabled(activeSelection == 3)
                    }
                    
                    
                    Spacer(minLength: 24)
                    
                    if(activeSelection == 1){
                        VStack(alignment: .leading) {
                            let types = pokemonDetail?.types ?? []
                            let abilities = pokemonDetail?.abilities ?? []
                            
                            PokemonAboutColumn(key: "Name", value: [pokemonDetail!.name])
                            PokemonAboutColumn(key: "Id", value: ["\(pokemonDetail!.id)"])
                            PokemonAboutColumn(key: "Base", value: ["\(pokemonDetail!.baseExp)"])
                            PokemonAboutColumn(key: "Weight", value: ["\(pokemonDetail!.weight)"])
                            PokemonAboutColumn(key: "Height", value: ["\(pokemonDetail!.height)"])
                            PokemonAboutColumn(key: "Types", value: types.map {$0.type!.name})
                            PokemonAboutColumn(key: "Abilities", value: abilities.map {$0.ability.name})
                        }.padding()
                        Spacer()
                    }
                    
                    if(activeSelection == 2){
                        VStack {
                            let stats = pokemonDetail?.stats ?? []
                            
                            ForEach(stats, id: \.stat) { stat in
                                PokemonStatBar(key: stat.stat.name, value: stat.baseStat)
                                Spacer(minLength: 24)
                            }
                        }.padding()
                        Spacer()
                        
                    }
                    
                    if(activeSelection == 3){
                        VStack {
                            /*
                             * Because pokemonEvolutions always has an element in the array
                             * We know that an error occured when the array is empty
                             */
                            if(pokemonEvolutions.count > 0){
                                ForEach(pokemonEvolutions, id: \.name) { evolution in
                                    PokemonEvolutionCell(pokemon: evolution)
                                }
                            } else {
                                Text("PokemonEvolutionError")
                            }
                        }
                    }
                    
                    Spacer()
                } else {
                    Spacer()
                    if(error != nil){
                        Text("PokemonDetailError")
                    } else {
                        ProgressView()
                    }
                    Spacer()
                }
            }.padding()
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                let isInList:Bool = favourites.isInListBy(pokemon)
                
                Button(
                    action: {
                        if(isInList){
                            favourites.removeFromFavourite(pokemon)
                        } else {
                            favourites.addToFavourites(pokemon)
                        }
                    },
                    label: {
                        Image(systemName: isInList ? "heart.fill" : "heart")
                            .foregroundStyle(isInList ? Color.red : Color.accentColor)
                    }
                )
            }
        }.task {
            await fetchPokemon()
        }
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(
            pokemon: Pokemon(url: "https://pokeapi.co/api/v2/pokemon/1/", name: "bulbasaur")
        ).environmentObject(PokemonFavourite())
    }
}
