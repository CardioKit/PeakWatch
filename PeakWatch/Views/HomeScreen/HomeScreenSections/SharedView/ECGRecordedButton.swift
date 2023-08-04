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
        Button {
            action()
        } label: {
            CardView(style: .background, cornerRadius: 5) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: headerIcon)
                                .font(.system(size: 20,  weight: .bold))
                                .foregroundColor(.red)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(headerTitle)
                                    .font(.system(size: 20,  weight: .bold))
                                    .foregroundColor(.red)
                                cardBody
                            }
                        }
                    }
                    Spacer()
                    cardIcon
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}
