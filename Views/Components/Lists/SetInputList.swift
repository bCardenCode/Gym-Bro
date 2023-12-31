//
//  SetInputList.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/29/23.
//

import SwiftUI

struct SetInputList: View {
    @Binding var sets: [Set]
    @State var border: Bool = true
    
    var body: some View {
        VStack {
            ForEach($sets) { $set in
                SetInputRow(set: $set)
            }
            HStack {
                Button("Remove Set") {
                    if sets.count > 0 {
                        sets.remove(at: sets.count - 1)
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(sets.count == 0 ? .gray : .red)
                Button("Add Set") {
                    sets.append(Set())
                }
                .buttonStyle(.borderedProminent)
            }
            
        }
    }
}

struct SetInputList_Previews: PreviewProvider {
    @State static var sets = [Set(), Set()]
    
    static var previews: some View {
        SetInputList(sets: $sets)
    }
}
