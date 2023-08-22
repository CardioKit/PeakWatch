//
//  TagViewModifier.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import Foundation
import SwiftUI

struct TagViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.padding(8)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
             )
    }
}
