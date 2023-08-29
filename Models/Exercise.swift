//
//  Exercise.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

import Foundation

struct Exercise: Identifiable {
    var id = UUID()
    var sets: [Set]
    var exercise: String
    var rating: Int?
    
    init() {
        self.sets = [Set]()
        self.exercise = noExercise
    }
    
    init(
        sets: [Set],
        exercise: String,
        rating: Int? = nil
    ) {
        self.sets = sets
        self.exercise = exercise
        self.rating = rating
    }
    
    init(sets: [Set]) {
        self.sets = sets
        self.exercise = noExercise
    }
    
    
}
