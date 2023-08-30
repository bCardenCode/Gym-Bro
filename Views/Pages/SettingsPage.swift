//
//  SettingsPage.swift
//  GymBroMain
//
//  Created by Brady Carden on 8/30/23.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var manager: DataManager
    
    var body: some View {
        ScrollView {
            Section {
                NavigationLink(destination: TestSettingsPage()) {
                    HStack {
                        Text("Testing Settings")
                        Spacer()
                        Image(systemName: navIcon)
                    }
                    .padding()
                   // .frame(width: RowWidth.full.val)
                    .border(.selection)
                }
            }
        }
        
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsPage()
                .navigationTitle("Settings")
                .environmentObject(DataManager(mock: true))
        }
    }
}

private struct TestSettingsPage: View {
    @EnvironmentObject var manager: DataManager
    
    var body: some View {
        VStack {
            Toggle("Show Border", isOn: $manager.designSettings.border)
                .padding()
            Spacer()
        }
        
    }
}
