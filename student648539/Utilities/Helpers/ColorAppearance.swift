//
//  ColorAppearance.swift
//  student648539
//
//  Created by Guido van Dijk on 15/10/2022.
//

import Foundation
import SwiftUI

func colorAppearance(){
    let coloredAppearance = UINavigationBarAppearance()
    
    coloredAppearance.backgroundColor = UIColor.init(Color(0xEDF6FF))

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
}
