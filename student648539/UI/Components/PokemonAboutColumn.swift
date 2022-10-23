//
//  PokemonAboutColumn.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

struct PokemonAboutColumn: View {
    let key:String
    let value:[String]
    
    var body: some View {
        HStack {
            Text(key)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .frame(width: 100, alignment: .leading)
            
            Text(value.joined(separator: ", "))
                .multilineTextAlignment(.leading)
        }.padding(.bottom, 16)
    }
}

struct PokemonAboutColumn_Previews: PreviewProvider {
    static var previews: some View {
        PokemonAboutColumn(key: "Name", value: ["Bulbasaur"])
    }
}
