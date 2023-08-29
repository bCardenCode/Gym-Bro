//
//  RowHeight.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

import SwiftUI

enum RowHeight {
    case small
    case medium
    case large
    case noBorder
    
    var val: CGFloat {
        
        switch self {
        case .small:
            return 30
        case .medium:
            return 40
        case .large:
            return 60
        case .noBorder:
            return 20
        }
        
    }
}
