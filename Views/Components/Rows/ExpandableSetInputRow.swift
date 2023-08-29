//
//  ExpandableSetInputRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/29/23.
//

import SwiftUI

struct ExpandableSetInputRow: View {
    @State var border: Bool = true
    @State var exercise: Exercise
    @State var width: RowWidth = .full
    @State var height: RowHeight = .medium
    @State var showRows: Bool = false
    
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
            
            if showRows {
                ForEach(exercise.sets) { set in
                    DisplaySetRow(set: set, width: .half)
                }
            }
        }
        
    }
}

struct ExpandableSetInputRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableSetInputRow(exercise: mockExercise1)
    }
}
