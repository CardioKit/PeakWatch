//
//  ECGFoundView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct ECGFoundView: View {
    
    @ObservedObject var ecgViewModel: ECGViewModel
    
    let cardBodyText = "ECGs detected"
    let cardIcon = "chevron.right"
    
    @Binding var isSheetOpen: Bool
    
    var body: some View {
        
        ECGRecordedButton {
            isSheetOpen.toggle()
        } cardBody: {
            Text(String(ecgViewModel.ecgs.count))
                .font(.system(size: 28, weight: .bold))
            Text(cardBodyText)
                .fontWeight(.light)
        } cardIcon: {
            Image(systemName: cardIcon)
        }
    }
}
