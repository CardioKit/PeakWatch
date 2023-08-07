//
//  ReportView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import SwiftUI

struct ReportView: View {
    
    @ObservedObject var exportViewModel: ExportViewModel
    let ecgPreviewText = "Export all ecgs"
    let exportButtonIcon = "square.and.arrow.up"
    
    var body: some View {
        
        CardWithHeader(headerIcon: "heart.fill",
                       headerTitle: "Electrocardiograms") {
            Text(String(exportViewModel.ecgs.count) + " Recordings analyzed")
                .font(.system(size: 18))
        }
        
        CardWithHeader(headerIcon: "stopwatch",
                       headerTitle: "Total execution time") {
            Text("\(String(format: "%.6f", exportViewModel.processTime.inMilliseconds)) ms")
                .font(.system(size: 18))
        }
        
        AlgorithmsTagsGridView(title: "Algorithms executed", algorithms: exportViewModel.algorithmsExecuted)
        
        Spacer()
        
        ShareLink(item: exportViewModel.ecgExports,
                  preview: SharePreview(ecgPreviewText)) {
            CardView(cornerRadius: 4) {
                HStack {
                    Image(systemName: exportButtonIcon)
                    Text("Share as JSON file")
                }.frame(maxWidth: .infinity)
            }
        }
    }
}
