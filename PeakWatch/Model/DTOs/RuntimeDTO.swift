//
//  RuntimeDTO.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct RuntimeDTO: Codable {
    
    let seconds: Int64
    let attoseconds: Int64
    
    static func createRuntimeDTO(duration: Duration) -> RuntimeDTO {
        return .init(seconds: duration.components.seconds, attoseconds: duration.components.attoseconds)
    }
    
}
