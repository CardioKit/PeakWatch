//
//  CardView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct CardView<CardContent: View, Style: ShapeStyle>: View {
    
    let style: Style
    let padding: CGFloat
    let cornerRadius: CGFloat
    @ViewBuilder let cardContent: CardContent
    
    init(style: Style = Colors.cardColor.value, padding: CGFloat = CGFloat(10), cornerRadius: CGFloat = 25, @ViewBuilder cardContent: () -> CardContent) {
        self.style = style
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.cardContent = cardContent()
    }
    
    var body: some View {
            
        cardContent
            .padding(.all, padding)
            .background(style)
            .cornerRadius(cornerRadius)
    }
}


