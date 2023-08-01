//
//  ECGExportDTOFactory.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 01.08.23.
//

import Foundation
import SwiftUI

enum ECGExportDTOFactory {
    
    
    static func createECGExportDTO(algorithmViewModel: AlgorithmViewModel) /*throws*/ -> ECGExportDTO {
        // The id should be unique. The same id is generated for apps that come from the same vendor running on the same device.
//        guard let deviceId = UIDevice.current.identifierForVendor else {
//            throw ExportError.uniqueIdentifierNotFound
//        }
        
        let deviceId = UIDevice.current.identifierForVendor!
        //let fileName = createFileName(ecgSample: algorithmViewModel.ecgSample)
        
        let ecgDTO = createECGDTO(algorithmViewModel: algorithmViewModel)
        let appleMetaDataDTO = createAppleMetaDataDTO(algorithmViewModel: algorithmViewModel)
        let rPeaksDTO = createRPeaksDTO(algorithmViewModel: algorithmViewModel)
        let signalQuality = createSignalQualityDTO(algorithmViewModel: algorithmViewModel)
        
        return .init(ecg: ecgDTO, appleMetaData: appleMetaDataDTO, algorithms: rPeaksDTO, signalQuality: signalQuality, deviceID: deviceId)
    }
    
    static private func createFileName(ecgSample: ECGSample) -> String {
            "ecg-sample_\(DateUtils.formatDateForTitle(date: ecgSample.startDate))"
    }
    
    static private func createECGDTO(algorithmViewModel: AlgorithmViewModel) -> ECGInformationDTO {
        let ecgSignal = algorithmViewModel.voltageMeasurementsNoMetaData
        let samplingRate = algorithmViewModel.samplingRateValue
        return .init(ecg: ecgSignal, samplingRate: samplingRate)
    }
    
    static private func createAppleMetaDataDTO(algorithmViewModel: AlgorithmViewModel) -> ECGAppleMetaDataDTO {
        let appleWatchSymptoms = algorithmViewModel.ecgSample.classification.description
        let beatsPerminute = algorithmViewModel.ecgSample.beatsPerMinute ?? 0
        return .init(appleRating: appleWatchSymptoms, beatsPerMinute: beatsPerminute)
    }
    
    static private func createRPeaksDTO(algorithmViewModel: AlgorithmViewModel) -> [RPeaksDTO]{
        let qrsResultsByAlgorithm = algorithmViewModel.qrsResultsByAlgorithm
        
        
        return qrsResultsByAlgorithm.map { qrsResultsByAlg in
            let peakPositions = qrsResultsByAlg.qrsResult.rPeaks
            let duration = qrsResultsByAlg.duration
            let algorithm = qrsResultsByAlg.algorithm.description
            
            let runtimeDTO = createRuntimeDTO(duration: duration)
            
            return .init(algorithm: algorithm, rPeaks: peakPositions, runtime: runtimeDTO)
        }
    }
    
    static private func createSignalQualityDTO(algorithmViewModel: AlgorithmViewModel) -> [SignalQualityDTO] {
        #warning("Pass the signal quality when implemented")
        let runtime = createRuntimeDTO(duration: .zero)
        return [.init(method: "dummyMethod", score: "Excellent", runtime: runtime)]
    }
    
    static  private func createRuntimeDTO(duration: Duration) -> RuntimeDTO {
        return .init(seconds: duration.components.seconds, attoseconds: duration.components.attoseconds)
    }
}
