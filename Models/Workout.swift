//
//  Workout.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

import Foundation

struct Workout: Identifiable {
    var id = UUID()
    var exercises: [Exercise]?
    var name: String?
    var rating: Int?
    var split: String?
    var date: String?
    
    init(
        exercises: [Exercise]? = [Exercise](),
        name: String? = nil,
        rating: Int? = nil,
        split: String? = nil,
        date: String? = nil
    ) {
        self.exercises = exercises
        self.name = name
        self.rating = rating
        self.split = split
        self.date = date
    }
    
    func getName() -> String {
        guard let name else {
            return split ?? noName
        }
        return name
    }
    
    mutating func addExercise() {
        if exercises != nil {
            exercises?.append(Exercise(sets: [Set()]))
        }
    }
}
