//
//  PrimaryButtonStyle.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .font(.title)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(5)
        }
    }
