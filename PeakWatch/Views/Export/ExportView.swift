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
    
    var ecgsProcessedPercentageLabel: String {
        let percentage = 100.0 * exportViewModel.amountOfECGProcess / exportViewModel.totalECGsToProcess
        return String(format: "%.0f", percentage)
    }
    
    init(ecgs: [ECGSample]) {
        self._exportViewModel = StateObject(wrappedValue: ExportViewModel(ecgs: ecgs))
    }
    
    var body: some View {
        VStack {
            if exportViewModel.isExportReady {
                ShareLink(item: exportViewModel.ecgExports, preview: SharePreview(ecgPreviewText))
            } else {
                LoadingLogo()
                ProgressView(value: exportViewModel.amountOfECGProcess, total: exportViewModel.totalECGsToProcess) {
                    Text("Running peak detection algorithms \(ecgsProcessedPercentageLabel)%")
                }.frame(maxWidth: 300)
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
