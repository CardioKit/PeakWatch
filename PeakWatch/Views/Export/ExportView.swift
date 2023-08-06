//
//  SwiftUIView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import SwiftUI

struct ExportView: View {
    
    @StateObject var exportViewModel: ExportViewModel
    
    init(ecgs: [ECGSample]) {
        self._exportViewModel = StateObject(wrappedValue: ExportViewModel(ecgs: ecgs))
    }
    
    var body: some View {
        VStack {
            Text("ECGs to export: \(exportViewModel.ecgs.count)")
            Text("ECGs exported: \(exportViewModel.ecgExports.count)")
        }.task {
            Task {
                await exportViewModel.processAllECGs()
            }
        }
    }
}
