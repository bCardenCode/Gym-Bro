//
//  ViewWorkoutsView.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/18/23.
//

import SwiftUI

struct ViewWorkoutsView: View {
    @EnvironmentObject var manager: DataManager
    
    var body: some View {
        ScrollView {
            ForEach(manager.workouts) { workout in
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
            ViewWorkoutsView()
                .environmentObject(DataManager(mock: true))
        }
    }
}
