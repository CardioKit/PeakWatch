//
//  SettingsButton.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 10.07.23.
//

import SwiftUI

struct SettingsButton: View {
    
    let buttonLabel = "gearshape"
    
    var body: some View {
        NavigationLink {
            SettingsView()
        } label: {
            Image(systemName: buttonLabel)
        }

    }
}
