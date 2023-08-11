//
//  ECGQualityRatingExtension.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import Foundation
import PeakSwift


extension ECGQualityRating: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .unacceptable:
            return "Unacceptable"
        case .barelyAcceptable:
            return "Barely acceptable"
        case .excellent:
            return "Excellent"
        }
    }
}
