//
//  ImportView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import SwiftUI

struct ImportView: View {
    
    @ObservedObject var importViewModel = ImportViewModel()
    
    var body: some View {
        Group {
            if let errorMessage = importViewModel.isError  {
                Text("Error during import: \(errorMessage)")
            } else if importViewModel.isLoading {
                ProgressView(
                )
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
                ExportView(ecgs: importViewModel.ecgSamples)
            }
        }.onDisappear {
            importViewModel.reset()
        }
        
    }
}
