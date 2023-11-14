//
//  LoadingScreenView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import SwiftUI

struct ExportProgressView<ExportViewModel: ExportableViewModel>: View {
    
    @ObservedObject var exportViewModel: ExportViewModel
    
    let progressText = "Algorithms running..."
    
    
    var ecgsProcessedPercentageLabel: String {
        let percentage = 100.0 * exportViewModel.amountOfECGProcess / exportViewModel.totalECGsToProcess
        return "\(String(format: "%.0f", percentage))%"
    }
    
    var body: some View {
        LoadingLogo()
        Spacer()
            .frame(maxHeight: 60)
        Text(progressText)
            .font(.system(size: 14, weight: .light))
        Text(ecgsProcessedPercentageLabel)
            .font(.system(size: 24, weight: .bold))
        ProgressView(value: exportViewModel.amountOfECGProcess, total: exportViewModel.totalECGsToProcess).frame(maxWidth: 300)
        }
    }

