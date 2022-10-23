//
//  String+Format.swift
//  student648539
//
//  Created by Guido van Dijk on 14/10/2022.
//

import Foundation

extension String {
    static func formatZeros(for id: Int) -> String {
        String(format: "%03d", id)
    }
    
    static func formatZerosAndHastag(for id: Int) -> String {
        String(format: "#%03d", id)
    }
}
