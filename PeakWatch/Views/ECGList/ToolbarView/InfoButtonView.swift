//
//  InfoButtonView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.07.23.
//

import SwiftUI

struct InfoButtonView: View {
    
    let infoButtonLabel = "Info"
    @ObservedObject var ecgViewModel: ECGViewModel
    @Binding var openInfoSheet: Bool
    
    var body: some View {
        Button {
            self.openInfoSheet = true
        } label: {
            Text(infoButtonLabel)
        }
    }
}
