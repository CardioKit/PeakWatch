//
//  ImportView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import SwiftUI

struct ImportView: View {
    
    @ObservedObject var importViewModel = ImportViewModel()
    
    let progressText = "Parsing dataset, that can take a few seconds..."
    
    var body: some View {
        Group {
            if let errorMessage = importViewModel.isError  {
                Text("Error during import \(errorMessage)")
            } else if importViewModel.isLoading {
                ProgressView()
                Spacer()
                    .frame(maxHeight: 10)
                Text(progressText)
                    .font(.system(size: 14, weight: .light))
                .fileImporter(
                    isPresented: $importViewModel.isOpenFileImport,
                    allowedContentTypes: [.json]
                ) { result in
                    importViewModel.importExternalDataSet(
                        resultImport: result
                    )
                }.onAppear(perform: {
                    self.importViewModel.isOpenFileImport = true
                })
            } else {
                ExportView(exportViewModel: ExportInMemoryViewModel(ecgs: importViewModel.ecgSamples))
            }
        }.onDisappear {
            importViewModel.reset()
        }
        
    }
}
