//
//  CardWithHeader.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import SwiftUI

struct CardWithHeader<CardContent: View>: View {
    
    
    let headerIcon: String
    let headerTitle: String
    @ViewBuilder let cardBody: CardContent
    
    var body: some View {
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
                }.frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
    }
}
