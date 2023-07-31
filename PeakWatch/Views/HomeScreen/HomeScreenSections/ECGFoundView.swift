//
//  ECGFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let navigationTitle = "ECG Samples"
    let buttonLabel = "Try out PeakWatch"
    var ecgRecordedText: String {
        "PeakWatch detected \(ecgViewModel.ecgs.count) recorded ECGs."
    }
    @Binding var isSheetOpen: Bool
    
    var body: some View {
        
        CardView(style: .background, cornerRadius: 5) {
            Text(ecgRecordedText).frame(maxWidth: .infinity)
        }

        VStack {
            Button {
                isSheetOpen.toggle()
            } label: {
                Text(buttonLabel)
            }
            .buttonStyle(.automatic)
        }
    }
}
