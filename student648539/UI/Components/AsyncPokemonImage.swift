//
//  AsyncPokemonImage.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import SwiftUI

struct AsyncPokemonImage: View {
    var url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .background(Color(red: 0.965, green: 0.964, blue: 1.0))
                    .cornerRadius(10.0, corners: [.topLeft, .topRight])
            } else if phase.error != nil {
                Color.gray.opacity(0.7)
            } else {
                ProgressView()
            }
        }
    }
}


