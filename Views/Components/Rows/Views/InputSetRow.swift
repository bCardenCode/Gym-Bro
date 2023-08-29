//
//  InputSetRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/17/23.
//

import SwiftUI

struct InputSetRow: View {
    @Binding var set: Set
    @State var weight: Int?
    @State var reps: Int?
    var width: RowWidth = .full
    var height: RowHeight = .large
    
    var body: some View {
        HStack {
            TextField("Weight", value: $weight, format: .number)
                .padding(5)
                .frame(width: 125)
                .onChange(of: weight) { weight in
                    set.weight = weight
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 2)
                )
            Image(systemName: "x.circle.fill")
            TextField("Reps", value: $reps, format: .number)
                .padding(5)
                .frame(width: 125)
                .onChange(of: reps) { reps in
                    set.reps = reps
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 2)
                )
        }
        .frame(width: width.val, height: height.val)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.red, lineWidth: 4)
        )
    }
}

struct InputSetRow_Previews: PreviewProvider {

    @State static var set: Set = Set()
    static var previews: some View {
        InputSetRow(set: $set)
    }
}
