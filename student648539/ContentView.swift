//
//  ContentView.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1

    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        TabView(selection: $selection) {
            HomePageView()
                .tabItem {
                    Image(selection == 1 ? "pokeball.fill" : "pokeball.line")
                    Text("Pokemons")
                }.tag(1)            
            FavouritePageView()
                .tabItem {
                    Image(systemName: selection == 2 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, .none)
                    Text("Favourite")
                }.tag(2)
        }.accentColor(Color(0x5631E8))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PokemonFavourite())
    }
}
