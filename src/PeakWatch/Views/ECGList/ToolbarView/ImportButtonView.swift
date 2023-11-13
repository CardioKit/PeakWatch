//
//  ImportButtonView.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 13.11.23.
//

import SwiftUI

struct ImportButtonView: View {

    
    var body: some View {
        NavigationLink {
            ImportView()
        } label: {
            Text("Imp")
        }
    }
}

