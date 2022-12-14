//
//  student648539App.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

@main
struct student648539App: App {
    @StateObject
    var favourites = PokemonFavourite()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(favourites)
        }
    }
}
