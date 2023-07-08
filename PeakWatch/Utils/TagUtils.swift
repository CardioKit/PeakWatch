//
//  TagUtils.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 08.07.23.
//

import Foundation
import PeakSwift

enum TagUtils {
    
    static func createTags(from algorithms: [Algorithms]) -> [Tag] {
        algorithms.map {Tag(text: $0.description)}
    }
}
