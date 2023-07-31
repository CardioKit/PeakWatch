//
//  ExportECGViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation

class ExportECGViewModel: ObservableObject {
    
    
    
    
    func exportECG(algorithmViewModel: AlgorithmViewModel) {
        
    }
    
    private func createECGExportDTO(algorithmViewModel: AlgorithmViewModel) -> ECGExportDTO {
        
        let ecgDTO = createECGDTO(algorithmViewModel: algorithmViewModel)
        
        let appleWatchSymptoms = algorithmViewModel.ecgSample.classification.description
        let beatsPerminute = algorithmViewModel.ecgSample.beatsPerMinute
        
    }
    
    private func createECGDTO(algorithmViewModel: AlgorithmViewModel) -> ECGInformationDTO {
        let ecgSignal = algorithmViewModel.voltageMeasurementsNoMetaData
        let samplingRate = algorithmViewModel.samplingRateValue
        return .init(ecg: ecgSignal, samplingRate: samplingRate)
    }
    
}
