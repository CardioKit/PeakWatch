//
//  ECGNotFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGNotFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let ecgNotFoundText = "No ECGs found. Please, try to record a few ECGs. (e.g. AppleWatch)"
    let refreshButtonLabel = "Refresh"
    
    var body: some View {
        VStack {
            Text(ecgNotFoundText)
        }
        VStack {
            Button {
                Task {
                    await ecgViewModel.getECGFromHealthStore()
                }
            } label: {
                Text(refreshButtonLabel).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            }
            .buttonStyle(.borderedProminent)

        }
    }
}


