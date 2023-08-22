//
//  ECGRecordedButton.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 01.08.23.
//

import SwiftUI

struct ECGRecordedButton<CardBody: View, CardIcon: View>: View {
    
    let action: () -> Void
    @ViewBuilder let cardBody: CardBody
    @ViewBuilder let cardIcon: CardIcon
    
    let headerIcon = "heart.fill"
    let headerTitle = "Electrocardiograms"
    
    var body: some View {
        CardWithHeader(headerIcon: headerIcon, headerTitle: headerTitle, cardBody: { cardBody }, cardIcon: { cardIcon }, action: action)
    }
}
