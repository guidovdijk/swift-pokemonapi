//
//  PokemonStatBar.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

struct PokemonStatBar: View {
    let key:String
    let value:Int
    
    var body: some View {
        ProgressView(value: 39, total: 255){
            HStack {
                Text(key)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(value)")
                    .fontWeight(.light)
                    .foregroundColor(Color(0x0E0940))
            }
        }
    }
}

struct PokemonStatBar_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatBar(key: "HP", value: 39)
    }
}
