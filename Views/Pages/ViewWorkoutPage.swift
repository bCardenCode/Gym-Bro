//
//  ViewWorkoutPage.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/22/23.
//

import SwiftUI

struct ViewWorkoutPage: View {
    @State var workout: Workout
    
    var body: some View {
        ScrollView {
            ForEach($workout.exercises) { $exercise in
                ExpandableExerciseRow(exercise: $exercise)
            }
        .padding(.horizontal)
        }
        .navigationTitle(workout.getName())
    }
    
}

struct ViewWorkoutPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewWorkoutPage(workout: mockWorkout1)
                .navigationTitle("View Workout")
        }
    }
}
