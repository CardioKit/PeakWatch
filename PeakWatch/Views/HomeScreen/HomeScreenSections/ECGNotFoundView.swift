//
//  ECGNotFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNotFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let ecgNotFoundText = "No ECGs detected."
    let refreshButtonIcon = "arrow.clockwise"
    
    var body: some View {
        
        ECGRecordedButton {
            Task {
                await ecgViewModel.getECGFromHealthStore()
            }
        } cardBody: {
            Text(ecgNotFoundText)
                .font(.system(size: 20, weight: .bold))
        } cardIcon: {
            Image(systemName: refreshButtonIcon)
                .font(.system(size: 20, weight: .bold))
        }
    }
}


