//
//  ECGNotFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNotFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let ecgNotFoundText = "No Recordings"
    let refreshIcon = "arrow.clockwise"
    
    var body: some View {
        
        ECGRecordedButton {
            Task {
                await ecgViewModel.getECGFromHealthStore()
            }
        } cardBody: {
            Text(ecgNotFoundText)
                .font(.system(size: 18))
        } cardIcon: {
            Image(systemName: refreshIcon)
                .font(.system(size: 20, weight: .bold))
        }
    }
}


