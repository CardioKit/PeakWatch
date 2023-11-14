//
//  ImportButtonView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import SwiftUI

struct ImportButtonView: View {

    let importButtonIcon = "square.and.arrow.down"
    
    var body: some View {
            NavigationLink {
                ImportView()
            } label: {
                Image(systemName: importButtonIcon)
            }
    }
}

