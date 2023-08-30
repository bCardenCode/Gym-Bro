//
//  DesignSettings.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/30/23.
//

import Foundation
import SwiftUI

class DesignSettings {
    @Published var primaryColor: Color
    @Published var secondaryColor: Color
    @Published var border: Bool
    
    init() {
        primaryColor = .red
        secondaryColor = .blue
        border = true
    }
    
    func flipBorder() {
        border = !border
    }
}
