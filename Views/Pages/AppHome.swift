//
//  AppHome.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/18/23.
//

import SwiftUI

struct AppHome: View {
    @StateObject var manager = DataManager(mock: true)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: AddWorkoutView()) {
                   BasicNavLinkLabel(title: addWorkoutTitle)
                }
                NavigationLink(destination: ViewWorkoutsView()) {
                    BasicNavLinkLabel(title: viewWorkoutsTitle)
                }
                Spacer()
            }
            .navigationTitle(appHomeTitle)
        }
        .environmentObject(manager)
    }
}

struct AppHome_Previews: PreviewProvider {
    static var previews: some View {
        AppHome()
    }
}
