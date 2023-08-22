//
//  FeatureGrid.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 12.07.23.
//

import Foundation

struct FeatureRow: Identifiable {
    
    let id = UUID()
    let featureRow: [Feature]
    
}
