//
//  RowWidth.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

import SwiftUI

enum RowWidth {
    case full
    case half
    
    var val: CGFloat {
        
        switch self {
        case .full:
            return 350
        case .half:
            return 200
        }
    }
}

enum RowWidthPortions {
    case half(RowWidth)
    case third(RowWidth)
    case quarter(RowWidth)
    
    var val: CGFloat {
        
        switch self {
        case .half(let width):
            return width.val / 2
        case .third(let width):
            return width.val / 3
        case .quarter(let width):
            return width.val / 4
        }
    }
}
