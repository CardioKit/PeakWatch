//
//  SecondaryInformationViewModifier.swift
//  PeakWatch
//
//  Created by x on 09.06.23.
//

import Foundation
import SwiftUI

struct SecondaryInfoListRowViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .leading)
    }
}
