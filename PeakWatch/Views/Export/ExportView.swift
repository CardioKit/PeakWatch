//
//  SwiftUIView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import SwiftUI

struct ExportView: View {
    
    @StateObject var exportViewModel: ExportViewModel
    let ecgPreviewText = "Export all ecgs"
    
    init(ecgs: [ECGSample]) {
        self._exportViewModel = StateObject(wrappedValue: ExportViewModel(ecgs: ecgs))
    }
    
    var body: some View {
        VStack {
            if exportViewModel.isExportReady {
                ShareLink(item: exportViewModel.ecgExports, preview: SharePreview(ecgPreviewText))
            } else {
                ExportProgressView(exportViewModel: exportViewModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.background.value)
        .task {
            Task {
                await exportViewModel.processAllECGs()
            }
        }
    }
}
