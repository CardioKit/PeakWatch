//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import Foundation
import Combine
import PeakSwift

class ExportViewModel: ObservableObject {
    
    let ecgs: [ECGSample]
    @Published var ecgExports: AllECGExportDTO = AllECGExportDTO(ecgs: [])
    var algorithmViewModels: [AlgorithmViewModel]
    
    var isExportReady: Bool {
        ecgs.count == ecgExports.ecgs.count
    }
    
    var totalECGsToProcess: Double {
        Double(ecgs.count)
    }
    
    var amountOfECGProcess: Double {
        Double(ecgExports.ecgs.count)
    }
    
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
    
    private var cancellables = Set<AnyCancellable>()
    
    init(ecgs: [ECGSample]) {
        self.ecgs = ecgs
        self.algorithmViewModels = ecgs.map { ecg in
            AlgorithmViewModel(ecgSample: ecg)
        }
        
        self.algorithmViewModels.forEach { algorithmViewModel in
            registerObserver(observable: algorithmViewModel, observer: algorithmViewModel.$canExport)
        }
    }
    
    func registerObserver<T>(observable: AlgorithmViewModel, observer: Published<T>.Publisher) {
        observer
            .dropFirst()
            .receive(on: DispatchQueue.main) 
            .sink(receiveValue: { [weak self] _ in
                self?.appendExportedECG(from: observable)
            }
        ).store(in: &cancellables)
    }
    
    func appendExportedECG(from algorithmViewModel: AlgorithmViewModel) {
        if let exportResult = algorithmViewModel.exportResults {
            self.ecgExports.ecgs.append(exportResult)
        }
    }
    
    func processAllECGs() async {
        for algorithmViewModel in algorithmViewModels {
            await algorithmViewModel.fetchVoltages()
        }
    }
    
}
