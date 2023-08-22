//
//  SettingsButton.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI

struct SettingsButtonView: View {
    
    let buttonIcon = "gearshape"
    
    var body: some View {
        NavigationLink {
            SettingsView()
        } label: {
            Image(systemName: buttonIcon)
        }

    }
}
