//
//  ECGFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let cardBodyText = " Recordings"
    let moveForwardIcon = "chevron.right"
    
    @Binding var isSheetOpen: Bool
    
    var body: some View {
        
        ECGRecordedButton {
            isSheetOpen.toggle()
        } cardBody: {
            Text(String(ecgViewModel.ecgs.count) + cardBodyText)
                .font(.system(size: 18))
        } cardIcon: {
            Image(systemName: moveForwardIcon)
                .font(.system(size: 20, weight: .bold))
        }
    }
}
