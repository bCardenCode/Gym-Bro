//
//  DataManager.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/19/23.
//

import Foundation

class DataManager: ObservableObject {
    @Published var workouts: [Workout]
    
    init(mock: Bool = false) {
        if mock {
            workouts = mockWorkouts
        } else {
            workouts = [Workout]()
        }
    }
}
