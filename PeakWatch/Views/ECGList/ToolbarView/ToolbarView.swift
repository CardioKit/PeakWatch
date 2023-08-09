//
//  ToolbarView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import SwiftUI

struct ToolbarView: View {
    
    let ecgs: [ECGSample]
    @Binding var openInfoSheet: Bool
    
    var body: some View {
        GlobalExportButtonView(ecgs: ecgs)
        InfoButtonView(openInfoSheet: $openInfoSheet)
        SettingsButtonView()
    }
}

