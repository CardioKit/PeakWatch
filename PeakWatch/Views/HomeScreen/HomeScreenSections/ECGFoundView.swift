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
    
    var body: some View {
        
        CardView(style: .green, cornerRadius: 5) {
            Text(ecgRecordedText).frame(maxWidth: .infinity)
        }

        VStack {
            NavigationLink {
                ECGListView(ecgViewModel: self.ecgViewModel)
                    .navigationTitle(navigationTitle)
            } label: {
                Text(buttonLabel).frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
