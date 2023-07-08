//
//  CardView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct CardView: View {
    
    var icon: String
    var text: String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(
                cornerSize: CGSize(width: 25, height: 25),
                style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/
            )
            .fill(.quaternary)
            
            HStack {
                Image(systemName: icon)
                Text(text)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
    }
}


