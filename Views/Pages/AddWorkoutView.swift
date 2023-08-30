//
//  AddWorkout.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/18/23.
//

import SwiftUI

struct AddWorkoutView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.dismiss) var dismiss
    @State var workout: Workout = Workout()
    @State var split: String = ""
    @State var date: Date = Date()
    @State var rating: Int?
    @State var name: String = ""
    @State var choosingExercise: Bool = false
    
    
    var body: some View {
        VStack {
            AddWorkoutHeader(name: $name, split: $split, workout: $workout)
            
            if workout.exercises.count == 0 {
                Spacer()
                Text(emptyAddWorkout)
                    .italic()
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            } else {
                ForEach($workout.exercises) { $exercise in
                    ExpandableExerciseRow(exercise: $exercise, showRows: true, input: true)
                }
            }
            
            Spacer()
            Button(
                action: {
                    manager.workouts.append(workout)
                    dismiss()
                }, label: {
                    BasicNavLinkLabel(title: "Finish Workout")
                })
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                choosingExercise = true
                            }, label: {
                                Text("Add Exercise")
                            })
                        .buttonStyle(.borderedProminent)
                    }
                }
                .sheet(isPresented: $choosingExercise) {
                    AddExerciseSheet(workout: $workout, showSheet: $choosingExercise)
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
                .environmentObject(DataManager(mock: true))
        }
    }
}

private struct AddExerciseSheet: View {
    @Binding var workout: Workout
    @Binding var showSheet: Bool
    @State var exerciseChoice: String = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Text(chooseExercise)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .italic()
                .foregroundColor(primaryColor)
            ScrollView {
                ForEach(splits, id: \.self) { split in
                    Button(
                        action:  {
                            exerciseChoice = split
                            workout.addExercise(name: split)
                            showSheet = false
                        }, label: {
                            BasicNavLinkLabel(title: split)
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            Spacer()
        }
        .padding(.top)

    }
}

private struct AddWorkoutHeader: View {
    @Binding var name: String
    @Binding var split: String
    @Binding var workout: Workout
    
    var body: some View {
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
                .onChange(of: name) { name in
                    workout.name = name
                }
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(UIColor.lightGray), lineWidth: 1)
                    .opacity(0.25)
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
    }
}


//This alert should display when finish workout is clicked and there is no name
private struct NoNameAlert: View {
    @State var name: String
    
    var body: some View {
        Text("Coming Soon")
    }
}
