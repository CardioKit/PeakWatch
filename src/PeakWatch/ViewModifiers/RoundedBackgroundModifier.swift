//
//  RoundedBackgroundModifier.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 30.07.23.
//

import Foundation
import SwiftUI

struct RoundedBackgroundModifier: ViewModifier {
   
    let cornerRadius: Double = 10
    
    func body(content: Content) -> some View {
        content.cornerRadius(cornerRadius) /// make the background rounded
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.gray)
            )
    }
    
    
    
}
