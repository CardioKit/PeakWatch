//
//  ExportECGViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 31.07.23.
//

import Foundation
import PeakSwift
import SwiftUI

class ExportECGViewModel: ObservableObject {
    
    @Published var jsonDocument: JSONDocument = JSONDocument(text: "")
    @Published var showExporter = false
    var documentName = "default"
    
    func exportECG(algorithmViewModel: AlgorithmViewModel) {
        
        do {
            let ecgExportDTO = try createECGExportDTO(algorithmViewModel: algorithmViewModel)
            let ecgExportDTOJSONString = try convertToJSON(ecgExportDTO: ecgExportDTO)
            generateFileName(ecgSample: algorithmViewModel.ecgSample)
            exportFile(text: ecgExportDTOJSONString)
            
        } catch {
            #warning("Inform user")
            print("error \(error)")
        }
    }
    
    func exportECGComplete(result: Result<URL, Error>) {
        switch result {
        case .success(let url):
            print("Saved to \(url)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    private func createECGExportDTO(algorithmViewModel: AlgorithmViewModel) throws -> ECGExportDTO {
        // The id should be unique. The same id is generated for apps that come from the same vendor running on the same device.
        guard let deviceId = UIDevice.current.identifierForVendor else {
            throw ExportError.uniqueIdentifierNotFound
        }
        
        let ecgDTO = createECGDTO(algorithmViewModel: algorithmViewModel)
        let appleMetaDataDTO = createAppleMetaDataDTO(algorithmViewModel: algorithmViewModel)
        let rPeaksDTO = createRPeaksDTO(algorithmViewModel: algorithmViewModel)
        let signalQuality = createSignalQualityDTO(algorithmViewModel: algorithmViewModel)
        
        return .init(ecg: ecgDTO, appleMetaData: appleMetaDataDTO, algorithms: rPeaksDTO, signalQuality: signalQuality, deviceID: deviceId)
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
            
            let runtimeDTO = createRuntimeDTO(duration: duration)
            
            return .init(algorithm: algorithm, rPeaks: peakPositions, runtime: runtimeDTO)
        }
    }
    
    private func createSignalQualityDTO(algorithmViewModel: AlgorithmViewModel) -> [SignalQualityDTO] {
        #warning("Pass the signal quality when implemented")
        let runtime = createRuntimeDTO(duration: .zero)
        return [.init(method: "dummyMethod", score: "Excellent", runtime: runtime)]
    }
    
    private func createRuntimeDTO(duration: Duration) -> RuntimeDTO {
        return .init(seconds: duration.components.seconds, attoseconds: duration.components.attoseconds)
    }
    
    private func convertToJSON(ecgExportDTO: ECGExportDTO) throws -> String {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let encodedData = try encoder.encode(ecgExportDTO)
        let encodedString = String(data: encodedData, encoding: .utf8)
        
        if let encodedString = encodedString {
            return encodedString
        } else {
            throw JSONError.failEncoding
        }
    }
    
    private func exportFile(text: String) {
        jsonDocument.text = text
        showExporter.toggle()
    }
    
    private func generateFileName(ecgSample: ECGSample) {
        documentName = "ecg-sample_\(DateUtils.formatDateForTitle(date: ecgSample.startDate))"
    }
}
