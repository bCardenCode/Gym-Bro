//
//  ExerciseSummaryRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/28/23.
//

import SwiftUI

struct ExpandableExerciseRow: View {
    @State var border: Bool = true
    @State var exercise: Exercise
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
                        if border {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(primaryColor, lineWidth: 5)
                        } else {
                            EmptyView()
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
            
            if showRows && input {
                SetInputList(sets: exercise.sets)
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
    static var previews: some View {
        ExpandableExerciseRow(exercise: mockExercise1, input: true)
    }
}
