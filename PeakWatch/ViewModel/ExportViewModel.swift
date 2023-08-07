//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import Foundation
import Combine

class ExportViewModel: ObservableObject {
    
    let ecgs: [ECGSample]
    @Published var ecgExports: AllECGExportDTO = AllECGExportDTO(ecgs: [])
    var algorithmViewModels: [AlgorithmViewModel]
    
    var isExportReady: Bool {
        ecgs.count == ecgExports.ecgs.count
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(ecgs: [ECGSample]) {
        self.ecgs = ecgs
        self.algorithmViewModels = ecgs.map { ecg in
            AlgorithmViewModel(ecgSample: ecg)
        }
        
        self.algorithmViewModels.forEach { algorithmViewModel in
            algorithmViewModel.$qrsResultsByAlgorithm
                .dropFirst()
                .receive(on: RunLoop.main)
                .sink(receiveValue: { _ in
                    let exportResult = algorithmViewModel.exportResults
                    self.ecgExports.ecgs.append(exportResult)
                    print("append \(exportResult.ecg.ecg.count)")
                }
            ).store(in: &cancellables)
        }
    }
    
    
    func processAllECGs() async {
        self.algorithmViewModels.forEach { algorithmViewModel in
            Task {
                await algorithmViewModel.fetchVoltages()
            }
        }
    }
    
}
