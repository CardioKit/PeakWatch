//
//  ECGSignalQuality.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import Foundation
import PeakSwift


struct ECGQuality: Identifiable {
    
    let id: UUID = UUID()
    let algorithm: ECGQualityAlgorithms
    let qualityRating: ECGQualityRating
    let runtime: Duration
}
