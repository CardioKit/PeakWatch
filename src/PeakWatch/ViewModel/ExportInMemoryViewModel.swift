//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import Foundation
import Combine
import PeakSwift

class ExportInMemoryViewModel: ExportableViewModel {
    
    
    let ecgs: [ECGSample]
    var ecgExports: AllECGExportDTO? {
        .init(ecgs: ecgResults)
    }
    var algorithmViewModels: [AlgorithmViewModel]
    
    
    @Published var ecgResults: [ECGExportDTO] = []
    
    var isExportReady: Bool {
        ecgs.count == ecgResults.count
    }
    
    var totalECGsToProcess: Double? {
        Double(ecgs.count)
    }
    
    var amountOfECGProcess: Double {
        Double(ecgResults.count)
    }
    
    let isError: String? = nil
    
    var processTime: Duration {
        let runtimes = ecgResults.compactMap { ecg in
            ecg.runtime
        }
        
        return runtimes.reduce(Duration.zero) { acc, nextDuration in
            acc + nextDuration
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
            self.ecgResults.append(exportResult)
        }
    }
    
    func processAllECGs() async {
        for algorithmViewModel in algorithmViewModels {
            await algorithmViewModel.fetchVoltages()
        }
    }
    
}
