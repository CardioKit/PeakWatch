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
    
    let ecgPreviewText = "ECG Export"
    
    var body: some View {
        ShareLink(item: algorithmViewModel.exportResults, preview: SharePreview(ecgPreviewText))
        
    }
}
