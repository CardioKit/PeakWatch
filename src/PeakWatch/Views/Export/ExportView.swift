//
//  SwiftUIView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import SwiftUI

struct ExportView<ExportViewModel: ExportableViewModel>: View {
    
    @StateObject var exportViewModel: ExportViewModel 
    
    let title = "Export ECGs"
    
    init(exportViewModel: ExportViewModel) {
        self._exportViewModel = StateObject(wrappedValue: exportViewModel)
    }
    
    var body: some View {
        VStack {
            if exportViewModel.isExportReady {
                ReportView(exportViewModel: exportViewModel)
                    .padding(10)
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
        }.navigationTitle(title)
    }
}
