//
//  SignalQualityDTO.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct SignalQualityDTO: Codable {
    
    let method: String
    let score: String
    let runtime: RuntimeDTO
    
    static func createSignalQualityDTO(algorithmViewModel: AlgorithmViewModel) -> [SignalQualityDTO] {
        #warning("Pass the signal quality when implemented")
        let runtime = RuntimeDTO.createRuntimeDTO(duration: .zero)
        return [.init(method: "dummyMethod", score: "Excellent", runtime: runtime)]
    }
}
