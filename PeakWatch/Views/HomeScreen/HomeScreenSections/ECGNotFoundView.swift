//
//  ECGNotFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNotFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    var body: some View {
        VStack {
            Text("No ECG found. Please, try to record a few ECGs. (e.g. AppleWatch)")
            Button("Refresh") {
                Task {
                    await ecgViewModel.getECGFromHealthStore()
                }
            }
        }
    }
}


