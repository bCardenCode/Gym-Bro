//
//  AddWorkout.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/18/23.
//

import SwiftUI

struct AddWorkoutView: View {
    @State var workout: Workout = Workout()
    @State var split: String = ""
    @State var date: Date = Date()
    @State var rating: Int?
    @State var name: String = ""
    
    
    var body: some View {
        VStack() {
            HStack {
                Text("Workout Name")
                    .padding(.leading, 20)
                Spacer()
                Text("Split")
                    .padding(.trailing, 20)

            }
            HStack {
                TextField("Enter name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: RowWidthPortions.half(.full).val)
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(UIColor.lightGray), lineWidth: 1)
                    Picker("Split", selection: $split) {
                        ForEach(splits, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .frame(width: RowWidthPortions.half(.full).val)
            }
            .padding(.bottom, 10)
            .frame(height: RowHeight.small.val)
            
            if workout.exercises?.count == 0{
                Text(emptyAddWorkout)
                    .multilineTextAlignment(.center)
            } else {
                ForEach(workout.exercises ?? [Exercise]()) { exercise in
                    ExpandableExerciseRow(exercise: exercise, showRows: true, input: true)
                }
            }
            
            Spacer()
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                workout.addExercise()
                            }, label: {
                                Text("Add Exercise")
                            })
                    }
                }
        }
        
        .navigationTitle("Add Workout")

    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddWorkoutView()
                .navigationTitle("Add Workout")
        }
    }
}
