//
//  DisplaySetRow.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/28/23.
//

import SwiftUI

struct DisplaySetRow: View {
    @EnvironmentObject var manager: DataManager
    @State var set: Set
    @State var border: Bool = true
    var width: RowWidth = .full
    var height: RowHeight = .medium
    
    var body: some View {
        ZStack {
            if manager.designSettings.border {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(primaryColor, lineWidth: 5)
            } else {
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .foregroundColor(Color(UIColor.lightGray))
                    .opacity(0.25)            }
            HStack {
                Spacer()
                Text("\(set.weight ?? -1)")
                Spacer()
                Image(systemName: "x.circle.fill")
                Spacer()
                Text("\(set.reps ?? -1)")
                Spacer()
            }
        }
        .frame(width: width.val, height: height.val)
    }
}

struct DisplaySetRow_Previews: PreviewProvider {
    static var previews: some View {
        DisplaySetRow(set: mockSet, border: false)
    }
}
