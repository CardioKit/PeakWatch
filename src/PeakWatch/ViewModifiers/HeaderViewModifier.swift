//
//  HeaderViewModifier.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct HeaderViewModifier: ViewModifier {
    
    let bottomPadding = CGFloat(5)
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding(.bottom, bottomPadding)
    }
}
