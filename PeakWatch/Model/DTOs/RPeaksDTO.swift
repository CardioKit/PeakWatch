//
//  RPeaks.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct RPeaksDTO: Codable {
    
    let algorithm: String
    let rPeaks: [UInt]
    let runtime: RuntimeDTO
    
    static func createRPeaksDTO(algorithmViewModel: AlgorithmViewModel) -> [RPeaksDTO]{
        let qrsResultsByAlgorithm = algorithmViewModel.qrsResultsByAlgorithm
        
        
        return qrsResultsByAlgorithm.map { qrsResultsByAlg in
            let peakPositions = qrsResultsByAlg.qrsResult.rPeaks
            let duration = qrsResultsByAlg.duration
            let algorithm = qrsResultsByAlg.algorithm.description
            
            let runtimeDTO = RuntimeDTO.createRuntimeDTO(duration: duration)
            
            return .init(algorithm: algorithm, rPeaks: peakPositions, runtime: runtimeDTO)
        }
    }
}
