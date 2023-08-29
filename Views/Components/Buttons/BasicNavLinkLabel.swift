//
//  BasicNavLinkLabel.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/29/23.
//

import SwiftUI

struct BasicNavLinkLabel: View {
    @State var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .frame(width: RowWidth.full.val, height: RowHeight.large.val)
                .foregroundColor(.blue)
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct BasicNavLinkLabel_Previews: PreviewProvider {
    static var previews: some View {
        BasicNavLinkLabel(title: "Title")
    }
}
