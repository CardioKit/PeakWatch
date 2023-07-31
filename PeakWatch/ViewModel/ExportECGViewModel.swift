//
//  ExportECGViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

class ExportECGViewModel: ObservableObject {
    
    
    
    
    func exportECG(algorithmViewModel: AlgorithmViewModel) {
        let ecgExportDTO = createECGExportDTO(algorithmViewModel: algorithmViewModel)
    }
    
    private func createECGExportDTO(algorithmViewModel: AlgorithmViewModel) -> ECGExportDTO {
        
        let ecgDTO = createECGDTO(algorithmViewModel: algorithmViewModel)
        let appleMetaDataDTO = createAppleMetaDataDTO(algorithmViewModel: algorithmViewModel)
        let rPeaksDTO = createRPeaksDTO(algorithmViewModel: algorithmViewModel)
        let signalQuality = createSignalQualityDTO(algorithmViewModel: algorithmViewModel)
        
        return .init(ecg: ecgDTO, appleMetaData: appleMetaDataDTO, algorithms: rPeaksDTO, signalQuality: signalQuality)
    }
    
    private func createECGDTO(algorithmViewModel: AlgorithmViewModel) -> ECGInformationDTO {
        let ecgSignal = algorithmViewModel.voltageMeasurementsNoMetaData
        let samplingRate = algorithmViewModel.samplingRateValue
        return .init(ecg: ecgSignal, samplingRate: samplingRate)
    }
    
    private func createAppleMetaDataDTO(algorithmViewModel: AlgorithmViewModel) -> ECGAppleMetaDataDTO {
        let appleWatchSymptoms = algorithmViewModel.ecgSample.classification.description
        let beatsPerminute = algorithmViewModel.ecgSample.beatsPerMinute ?? 0
        return .init(appleRating: appleWatchSymptoms, beatsPerMinute: beatsPerminute)
    }
    
    private func createRPeaksDTO(algorithmViewModel: AlgorithmViewModel) -> [RPeaksDTO]{
        let qrsResultsByAlgorithm = algorithmViewModel.qrsResultsByAlgorithm
        
        
        return qrsResultsByAlgorithm.map { qrsResultsByAlg in
            let peakPositions = qrsResultsByAlg.qrsResult.rPeaks
            let duration = qrsResultsByAlg.duration
            let algorithm = qrsResultsByAlg.algorithm.description
            
            return .init(algorithm: algorithm, rPeaks: peakPositions, duration: duration)
        }
    }
    
    private func createSignalQualityDTO(algorithmViewModel: AlgorithmViewModel) -> [SignalQualityDTO] {
        #warning("Pass the signal quality when done")
        return [.init(method: "dummyMethod", score: "Excellent", runtime: .zero)]
    }
}
