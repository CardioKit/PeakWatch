//
//  CardView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct CardView<CardContent: View>: View {
    
    let style: HierarchicalShapeStyle //= HierarchicalShapeStyle.quaternary
    let padding: CGFloat  //= CGFloat(10)
    @ViewBuilder let cardContent: CardContent
    
    init(style: HierarchicalShapeStyle = .quaternary, padding: CGFloat = CGFloat(10), @ViewBuilder cardContent: () -> CardContent) {
        self.style = style
        self.padding = padding
        self.cardContent = cardContent()
    }
    
    var body: some View {
        ZStack {
//            RoundedRectangle(
//                cornerSize: CGSize(width: 25, height: 25),
//                style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/
//            )
//            .fill(style)
            
            cardContent.padding(padding).background(style).cornerRadius(25)
           // .multilineTextAlignment(.center)
        }
    }
}


