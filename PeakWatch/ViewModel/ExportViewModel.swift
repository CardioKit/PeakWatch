//
//  ExportViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 06.08.23.
//

import Foundation

class ExportViewModel: ObservableObject {
    
    let ecgs: [ECGSample]
    @Published var ecgExports: [ECGExportDTO] = []
    
    init(ecgs: [ECGSample]) {
        self.ecgs = ecgs
    }
    
    
    func processAllECGs() async {
        self.ecgs.map { ecg in
            AlgorithmViewModel(ecgSample: ecg, algorithmsPerformedCallback: addECGExport)
        }.forEach { algorithmViewModel in
            Task {
                await self.processSingleECG(algorithmViewModel: algorithmViewModel)
            }
        }
    }
    
    private func processSingleECG(algorithmViewModel: AlgorithmViewModel) async {
        await algorithmViewModel.fetchVoltages()
    }
    
    func addECGExport(_ algorithmViewModel: AlgorithmViewModel) {
        let ecgExport = algorithmViewModel.exportResults
        self.ecgExports.append(ecgExport)
    }
}
