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
    let headerTitle = "Electrocardiogramms (ECGs)"
    
    var body: some View {
        Button {
            action()
        } label: {
            CardView(style: .background, cornerRadius: 5) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: headerIcon)
                            Text(headerTitle)
                        }
                        .font(.system(size: 18,  weight: .bold))
                        .foregroundColor(.red)
                        HStack(alignment: .bottom) {
                            cardBody
                        }
                    }
                    Spacer()
                    cardIcon
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}
