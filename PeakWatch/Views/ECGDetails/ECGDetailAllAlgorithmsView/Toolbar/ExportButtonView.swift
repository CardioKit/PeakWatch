//
//  ExportButtonView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import SwiftUI

struct ExportButtonView: View {
    
    
    @ObservedObject var algorithmViewModel: AlgorithmViewModel
    @StateObject var exportECGViewModel: ExportECGViewModel = ExportECGViewModel()
    
    let exportButtonLabel = "Export"
    
    
    var body: some View {
        Button {
            exportJSON()
        } label: {
            Text(exportButtonLabel)
        }
    }
    
    func exportJSON() {
        exportECGViewModel.exportECG(algorithmViewModel: algorithmViewModel)
    }
}
