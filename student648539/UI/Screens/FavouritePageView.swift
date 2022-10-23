//
//  FavouritePageView.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

struct FavouritePageView: View {
    @State var selection = 1
    
    @EnvironmentObject
    var favourites: PokemonFavourite
    
    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    init() {
        colorAppearance()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    if(favourites.pokemons.count > 0){
                        LazyVGrid(columns: testGrid, spacing: 12){
                            ForEach(favourites.pokemons, id: \.name) { pokemon in
                                NavigationLink(
                                    destination: PokemonDetailView(pokemon: pokemon)
                                ){
                                    PokemonCell(pokemon: pokemon)
                                }
                                
                            }
                        }.padding()
                    } else {
                        HStack {
                            Spacer()
                            Text("NoFavourites")
                            Spacer()
                        }
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                    }
                }
                .background(Color(0xEDF6FF))
                .navigationTitle("FavouritesTitle")
            }
        }
    }
}

struct FavouritePageView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritePageView().environmentObject(PokemonFavourite())
    }
}
