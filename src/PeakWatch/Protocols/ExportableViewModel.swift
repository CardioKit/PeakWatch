//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation
import PeakSwift


protocol ExportableViewModel: ObservableObject {
    
    var isExportReady: Bool { get }
    
    var totalECGsToProcess: Double { get }
    
    var amountOfECGProcess: Double { get }
    
    var ecgExports: AllECGExportDTO { get }
    
    func processAllECGs() async
    
    var algorithmsExecuted: [Algorithms] { get }
    
    var processTime: Duration { get }
}

extension ExportableViewModel {
    
    var algorithmsExecuted: [Algorithms] {
        Array(UserSettingsViewModel().selectedAlgorithms)
    }
    
    var processTime: Duration {
        let runtimes = ecgExports.ecgs.flatMap { ecg in
            let runtimesAlgorithms = ecg.algorithms.compactMap { algorithm in
                algorithm.runtime
            }
            let runtimesQuality = ecg.signalQuality.compactMap { signalQuality in
                signalQuality.runtime
                
            }
            
            return runtimesAlgorithms + runtimesQuality
        }
        
        return runtimes.reduce(Duration.zero) { acc, nextDuration in
            acc + Duration(secondsComponent: nextDuration.seconds, attosecondsComponent: nextDuration.attoseconds)
        }
    }
}
