//
//  SetInputList.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/29/23.
//

import SwiftUI

struct SetInputList: View {
    @State var sets: [Set]
    @State var border: Bool = true
    
    var body: some View {
        VStack {
            ForEach(sets) { set in
                SetInputRow(set: set)
            }
            Button("Add Set") {
                sets.append(Set())
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct SetInputList_Previews: PreviewProvider {
    static var previews: some View {
        SetInputList(sets: mockSets1)
    }
}
