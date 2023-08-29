//
//  Set.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

import Foundation

struct Set: Identifiable {
    var id =  UUID()
    var weight: Int?
    var reps: Int?
    
    init() {
        self.weight = nil
        self.reps = nil
    }
    
    init(
        _ weight: Int,
        _ reps: Int
    ) {
        self.weight = weight
        self.reps = reps
    }
}
