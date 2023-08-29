//
//  SummaryRowUse.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/28/23.
//

import Foundation
import SwiftUI

enum SummaryRowUse {
    case navigation
    case expandable(Bool)
    
    var val: Image {
        switch self {
        case .navigation:
            return navigationIcon
        case .expandable(let expand):
            return expand ? expandIcon : minimizeIcon
        }
    }
}

let navigationIcon: Image = Image(systemName: navIcon)
let expandIcon: Image = Image(systemName: expand)
let minimizeIcon: Image = Image(systemName: minimize)
