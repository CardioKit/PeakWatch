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
    
    let buttonIcon = "square.and.arrow.up"
    
    let exportErrorTitle = "Export Error"
    let exportErrorBody = "An error occured during export of the ECG data."
    
    var body: some View {
        ShareLink(algorithmViewModel.exportTile, item: algorithmViewModel.exportResults, preview: SharePreview("ECG Export"))
    }
}
