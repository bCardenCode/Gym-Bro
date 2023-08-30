//
//  ExerciseSummaryRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/28/23.
//

import SwiftUI

struct ExpandableExerciseRow: View {
    @EnvironmentObject var manager: DataManager
    @State var border: Bool = true
    @Binding var exercise: Exercise
    @State var width: RowWidth = .full
    @State var height: RowHeight = .medium
    @State var showRows: Bool = false
    @State var input: Bool = false
    
    var body: some View {
        VStack {
            Button(
                action: {
                    showRows = !showRows
                }, label: {
                    ZStack {
                        if manager.designSettings.border {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(primaryColor, lineWidth: 5)
                        } else {
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .foregroundColor(Color(UIColor.lightGray))
                                .opacity(0.5)
                            
                        }
                        HStack {
                            HStack {
                                Text(exercise.exercise)
                                    .fontWeight(.heavy)
                                    .foregroundColor(secondaryColor)
                                    .italic()
                                    .padding(.leading, 15)
                            }
                            .frame(width: RowWidthPortions.half(width).val, alignment: .leading)
                            HStack {
                                Text(divider)
                                Text("\(exercise.sets.count) Sets")
                                Spacer()
                                Image(systemName: showRows ? minimize : expand)

                            }
                            .padding(.trailing)
                            .frame(width: RowWidthPortions.half(width).val)
                            
                        }
                    }
                    .frame(width: width.val, height: height.val)
                }
            )
            .buttonStyle(.plain)
            if !border {
                Divider()
                    .frame(width: width.val)
            }
            
            if showRows && input {
                SetInputList(sets: $exercise.sets)
            } else if showRows {
                ForEach(exercise.sets) { set in
                    DisplaySetRow(set: set, width: .half)
                }
            } else {
                EmptyView()
            }
        }
    }
}

struct ExpandableExerciseRow_Previews: PreviewProvider {
    @State static var exercise = Exercise(sets: mockSets1, exercise: benchPress, rating: 9)
    
    static var previews: some View {
        ExpandableExerciseRow(border: false, exercise: $exercise, input: true)
    }
}
