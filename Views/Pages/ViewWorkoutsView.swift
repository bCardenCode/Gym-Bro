//
//  ViewWorkoutsView.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/18/23.
//

import SwiftUI

struct ViewWorkoutsView: View {
    @State var workouts: [Workout]
    var body: some View {
        ScrollView {
            ForEach(workouts) { workout in
                NavigationLink(destination: ViewWorkoutPage(workout: workout)) {
                    WorkoutNavLink(workout: workout)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .navigationTitle("View Workouts")
        }
    }
}

struct ViewWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewWorkoutsView(workouts: [mockWorkout1, mockWorkout2])
        }
    }
}
