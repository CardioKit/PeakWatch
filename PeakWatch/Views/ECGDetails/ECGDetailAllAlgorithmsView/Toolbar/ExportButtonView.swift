//
//  ExportButtonView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ExportButtonView: View {
    
    
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    @StateObject var exportECGViewModel: ExportECGViewModel = ExportECGViewModel()
    
    let exportButtonLabel = "Export"
    
    let exportErrorTitle = "Export Error"
    let exportErrorBody = "An error occured during export of the ECG data."
    
    var body: some View {
        Button {
            exportJSON()
        } label: {
            Text(exportButtonLabel)
        }
        .fileExporter(
            isPresented: $exportECGViewModel.showExporter,
            document: exportECGViewModel.jsonDocument,
            contentType: .json,
            defaultFilename: exportECGViewModel.documentName) {
                result in exportECGViewModel.exportECGComplete(result: result)
            }.alert(exportErrorTitle, isPresented: $exportECGViewModel.hasExportError, actions: {}) {
                Text(exportErrorBody)
            }

        }
    
    func exportJSON() {
        exportECGViewModel.exportECG(algorithmViewModel: algorithmViewModel)
    }
}
