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
        
        VStack {
            Text(ecgRecordedText)
        }

        VStack {
            NavigationLink(destination:
                            ECGListView(ecgViewModel: self.ecgViewModel).navigationTitle(navigationTitle)) {
                Text(self.buttonLabel)
            }
        }
    }
}
