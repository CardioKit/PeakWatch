//
//  ExportECGViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import PeakSwift

class ExportECGViewModel: ObservableObject {
    
    @Published var jsonDocument: JSONDocument = JSONDocument(text: "")
    @Published var showExporter = false
    var documentName = "default"
    
    func exportECG(algorithmViewModel: AlgorithmViewModel) {
        let ecgExportDTO = createECGExportDTO(algorithmViewModel: algorithmViewModel)
        
        do {
            let ecgExportDTOJSONString = try convertToJSON(ecgExportDTO: ecgExportDTO)
            generateFileName(ecgSample: algorithmViewModel.ecgSample)
            exportFile(text: ecgExportDTOJSONString)
            
        } catch {
            #warning("Inform user")
            print("error \(error)")
        }
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
    
    private func convertToJSON(ecgExportDTO: ECGExportDTO) throws -> String {
        let converter = JSONConverter<ECGExportDTO>()
        return try converter.serialize(toConvert: ecgExportDTO)
    }
    
    private func storeToFile(text: String) throws {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("myJsonString.json")
            try text.write(to: pathWithFilename,
                                     atomically: true,
                                     encoding: .utf8)
            let input = try String(contentsOf: pathWithFilename)
            print(pathWithFilename)
            //print(input)
            print("Store file")
        } else {
            print("url not found")
        }
    }
    
    private func exportFile(text: String) {
        jsonDocument.text = text
        showExporter.toggle()
    }
    
    private func generateFileName(ecgSample: ECGSample) {
        documentName = "ecg-sample-\(DateUtils.formatDate(date: ecgSample.startDate))"
    }
}
