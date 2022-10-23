//
//  HomePage.swift
//  inhollandExercise
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

struct HomePageView: View {
    @State var selection = 1
    @State var pokemons:[Pokemon] = []
    @State var error:Error? = nil

    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    private func getPokemons() async {
        do {
            let res = try await APIService().fetchPokemons()
            pokemons = res.results
            self.error = nil
        } catch {
            print(error)
            self.error = error
        }
    }
    
    init() {        
        colorAppearance()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    if(pokemons.count > 0){
                        LazyVGrid(columns: testGrid, spacing: 12){
                            ForEach(pokemons, id: \.self) { pokemon in
                                NavigationLink(
                                    destination: PokemonDetailView(pokemon: pokemon)
                                ){
                                    PokemonCell(pokemon: pokemon)
                                }
                            }
                        }
                        .padding()
                    } else {
                        HStack {
                            Spacer()
                            if(error != nil){
                                Text("HomePageError")
                                    .padding()
                                    .multilineTextAlignment(.center)
                            } else {
                                ProgressView()
                            }
                            Spacer()
                        }
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                    }
                }
                .task {
                    await getPokemons()
                }
                .background(Color(0xEDF6FF))
                .navigationTitle("HomepageTitle")
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView().environmentObject(PokemonFavourite())
    }
}
