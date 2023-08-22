//
//  TagView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct TagView: View {
    
    let text: String
    
    var body: some View {
        Text(text).modifier(TagViewModifier())
    }
}
