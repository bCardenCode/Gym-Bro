//
//  WorkoutSummaryRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/28/23.
//

import SwiftUI

struct WorkoutNavLink: View {
    @State var border: Bool = true
    @State var workout: Workout
    @State var showRows: Bool = false
    var width: RowWidth = .full
    var height: RowHeight = .medium
    
    var body: some View {
        ZStack {
            if border {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(primaryColor, lineWidth: 5)
            } else {
                EmptyView()
            }
            HStack {
                HStack {
                    Text(workout.getName())
                        .fontWeight(.heavy)
                        .foregroundColor(secondaryColor)
                        .italic()
                        .padding(.leading, 15)

                }
                .frame(width: RowWidthPortions.half(width).val, alignment: .leading)
                HStack {
                    Text(divider)
                    Text("\(workout.exercises.count) Exercises")
                    Spacer()
                    Image(systemName: navIcon)
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
                .frame(width: RowWidthPortions.half(width).val, alignment: .leading)
            }
        }
        .frame(width: width.val, height: height.val)
    }
}

struct WorkoutNavLink_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutNavLink(workout: mockWorkout1)
    }
}
