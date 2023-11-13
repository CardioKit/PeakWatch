//
//  ImportView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import SwiftUI

struct ImportView: View {
    
    @ObservedObject var importViewModel = ImportViewModel(
    )
    
    var body: some View {
        ProgressView(
        )
        .fileImporter(
            isPresented: $importViewModel.isLoading,
            allowedContentTypes: [.json]
        ) { result in
            importViewModel.importExternalDataSet(
                resultImport: result
            )
        }.onAppear(perform: {
            self.importViewModel.isLoading = true
        }
        )
    }
}
