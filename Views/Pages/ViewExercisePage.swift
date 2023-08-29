//
//  ViewExercisePage.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/22/23.
//

import SwiftUI

struct ViewExercisePage: View {
    @State var exercise: Exercise
    
    var body: some View {
        VStack {
            Text("Uh oh....")
            Text(":(")
        }

    }
}

struct ViewExercisePage_Previews: PreviewProvider {
    static var previews: some View {
        ViewExercisePage(exercise: mockExercise1)
    }
}
