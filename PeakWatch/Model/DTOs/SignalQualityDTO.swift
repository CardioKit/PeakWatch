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
        let ecgQualities = algorithmViewModel.ecgQualityByAlgortihm.map { ecgQualityByAlgorithm in
            let runtime = RuntimeDTO.createRuntimeDTO(duration: ecgQualityByAlgorithm.runtime)
            return SignalQualityDTO(
                method: ecgQualityByAlgorithm.algorithm.exportName,
                score: ecgQualityByAlgorithm.qualityRating.exportName,
                runtime: runtime)
            
        }
        return ecgQualities
    }
}
