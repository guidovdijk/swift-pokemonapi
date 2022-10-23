//
//  PokemonType.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

struct PokemonTypeBadge: View {
    let type:String
    private let backgroundColor:Color
    private let foregroundColor:Color

    init(type:String){
        self.type = type
        backgroundColor = Color.get(for: type.capitalized)
        foregroundColor = backgroundColor.isDarkColor == true ? .white : .black
    }
    
    var body: some View {
        Text(type.capitalized)
            .font(.callout)
            .fontWeight(.semibold)
            .padding(.horizontal, 14)
            .padding(.vertical, 4)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(100)
    }
}

struct PokemonTypeBadge_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeBadge(type: "Poison")
    }
}
