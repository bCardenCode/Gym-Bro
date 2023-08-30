//
//  SetInputRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/29/23.
//

import SwiftUI

struct SetInputRow: View {
    @Binding var set: Set
    @State var border: Bool = true
    @State var weight: Int?
    @State var reps: Int?
    var width: RowWidth = .subrow
    var height: RowHeight = .medium
    
    var body: some View {
        ZStack {
            if border {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(secondaryColor, lineWidth: 4)
            } else {
                EmptyView()
            }
            HStack {
                TextField("Weight", value: $weight, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .frame(width: 125)
                    .onChange(of: weight) { weight in
                        set.weight = weight
                    }
                Image(systemName: "x.circle.fill")
                TextField("Reps", value: $reps, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .frame(width: 125)
                    .onChange(of: reps) { reps in
                        set.reps = reps
                    }
            }
        }
        .frame(width: width.val, height: height.val)

    }
}

struct SetInputRow_Previews: PreviewProvider {
    @State static var set: Set = Set()
    static var previews: some View {
        SetInputRow(set: $set)
    }
}
