//
//  ExportButtonView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import SwiftUI

struct GlobalExportButtonView: View {
    
    let ecgs: [ECGSample]
    let exportButtonIcon = "square.and.arrow.up"
    
    var body: some View {
        NavigationLink {
            ExportView(ecgs: [[ECGSample]].init(repeating: ecgs, count: 1).flatMap { $0 })
        } label: {
            Image(systemName: exportButtonIcon)
        }
    }
}
