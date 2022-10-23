//
//  Color+HexColor.swift
//  student648539
//
//  Created by Guido van Dijk on 13/10/2022.
//

import SwiftUI

extension UIColor
{
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.60
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
          .sRGB,
          red: Double((hex >> 16) & 0xFF) / 255,
          green: Double((hex >> 8) & 0xFF) / 255,
          blue: Double(hex & 0xFF) / 255,
          opacity: alpha
        )
    }
    
    /*
     * To make sure the text is readable on every background color,
     * The background color gets checked and returns:
     * true, if it is a dark color and
     * false, if it is a light color.
    */
    var isDarkColor : Bool {
        return UIColor(self).isDarkColor
    }
    
    /*
     * Colors used are the official colors of the Pokemon types,
     * So some colors will differ from the design.
    */
    static func get(for type: String) -> Color {
        switch type {
        case "Normal": return Color(0xA8A77A)
        case "Fire": return Color(0xEE8130)
        case "Water": return Color(0x6390F0)
        case "Electric": return Color(0xF7D02C)
        case "Grass": return Color(0x7AC74C)
        case "Ice": return Color(0x96D9D6)
        case "Fighting": return Color(0xC22E28)
        case "Poison": return Color(0xA33EA1)
        case "Ground": return Color(0xE2BF65)
        case "Flying": return Color(0xA98FF3)
        case "Psychic": return Color(0xF95587)
        case "Bug": return Color(0xA6B91A)
        case "Rock": return Color(0xB6A136)
        case "Ghost": return Color(0x735797)
        case "Dragon": return Color(0x6F35FC)
        case "Dark": return Color(0x705746)
        case "Steel": return Color(0xB7B7CE)
        case "Fairy": return Color(0xD685AD)
        default:
            assertionFailure("missing color for \(type)")
            return Color.gray
        }
    }
}
