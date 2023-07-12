//
//  ToolbarView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import SwiftUI

struct ToolbarView: View {
    
    @Binding var openInfoSheet: Bool
    
    var body: some View {
        InfoButtonView(openInfoSheet: $openInfoSheet)
        SettingsButtonView()
    }
}

