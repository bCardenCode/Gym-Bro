//
//  MockSets.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

let mockSet = Set(100, 10)

let mockSets1 = [
    Set(300, 15),
    Set(200, 10),
    Set(100, 5)
]

let mockSets2 = [
    Set(30, 50),
    Set(20, 25),
    Set(10, 10)
]

let mockSets3 = [
    Set(100, 9),
    Set(75, 8),
    Set(50, 7)
]

let mockSets4 = [
    Set(350, 25),
    Set(250, 20),
    Set(150, 15)
]

let mockSets5 = [
    Set(80, 60),
    Set(70, 35),
    Set(60, 20)
]

let mockSets6 = [
    Set(150, 19),
    Set(125, 18),
    Set(100, 17)
]


let mockExercise1 = Exercise(sets: mockSets1, exercise: benchPress, rating: 9)
let mockExercise2 = Exercise(sets: mockSets2, exercise: deadlift, rating: 10)
let mockExercise3 = Exercise(sets: mockSets3, exercise: bicepCurl, rating: 7)
let mockExercise4 = Exercise(sets: mockSets4, exercise: nordicCurl, rating: 9)
let mockExercise5 = Exercise(sets: mockSets5, exercise: legPress, rating: 10)
let mockExercise6 = Exercise(sets: mockSets6, exercise: tricepExt, rating: 7)

let mockWorkout1 = Workout(exercises: [mockExercise1, mockExercise2, mockExercise3], rating: 8, split: "Full Body")
let mockWorkout2 = Workout(exercises: [mockExercise4, mockExercise5, mockExercise6], rating: 9, split: "Legs")

let mockWorkouts = [mockWorkout1, mockWorkout2]
