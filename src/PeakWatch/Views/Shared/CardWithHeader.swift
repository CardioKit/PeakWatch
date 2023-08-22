//
//  CardWithHeader.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import SwiftUI

struct CardWithHeader<CardContent: View, CardIcon: View>: View {
    
    
    let headerIcon: String
    let headerTitle: String
    let cardBody: CardContent
    
    var action: () -> Void = {}
    var cardIcon: CardIcon
    
    init(headerIcon: String, headerTitle: String, @ViewBuilder cardBody: () -> CardContent, @ViewBuilder cardIcon: () -> CardIcon, action: @escaping () -> Void = {}) {
        self.headerIcon = headerIcon
        self.headerTitle = headerTitle
        self.cardBody = cardBody()
        self.cardIcon = cardIcon()
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            card
        }.buttonStyle(PlainButtonStyle())
    }
    
    var card: some View {
        CardView(cornerRadius: 4) {
            VStack(spacing: 5) {
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
        }
    }
}

extension CardWithHeader where CardIcon == EmptyView {
    
    init(headerIcon: String, headerTitle: String, @ViewBuilder cardBody: () -> CardContent) {
        self.init(headerIcon: headerIcon, headerTitle: headerTitle, cardBody: cardBody, cardIcon: { EmptyView() })
    }
}
