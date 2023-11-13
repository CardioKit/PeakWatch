//
//  ECGInformation.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

struct ECGInformationDTO: Codable {
    
    let ecg: [Double]
    let samplingRate: Double
    
    static func createECGDTO(algorithmViewModel: AlgorithmViewModel) -> ECGInformationDTO {
        let ecgSignal = algorithmViewModel.voltageMeasurementsNoMetaData
        let samplingRate = algorithmViewModel.samplingRateValue
        return .init(ecg: ecgSignal, samplingRate: samplingRate)
    }
}
