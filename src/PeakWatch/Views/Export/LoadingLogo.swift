//
//  LoadingLogo.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 07.08.23.
//

import SwiftUI

struct LoadingLogo: View {
    
    let width: CGFloat = 180
    var height: CGFloat {
        width - 2 * padding
    }
    let padding: CGFloat = 20
    let cornerRadius: CGSize = CGSizeMake(10, 10)
    let icon = "waveform.path.ecg"
    
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .foregroundStyle(.red)
            .frame(width: width, height: height)
            .padding([.top, .bottom], padding)
            .background(Colors.cardColor.value)
            .clipShape(
                RoundedRectangle(cornerSize: cornerRadius)
            ).shadow(radius: 2)
    }
}
