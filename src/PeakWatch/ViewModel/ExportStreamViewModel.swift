//
//  ExportViewStreamViewModel.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 14.11.23.
//

import Foundation
import Combine

class ExportStreamViewModel: ExportableViewModel {
    
    
    // Interface properties
    var isExportReady: Bool = false
    
    var totalECGsToProcess: Double {
        return 100000
    }
    
    var amountOfECGProcess: Double {
        return 0
    }
    
    var processTime: Duration {
        Duration.zero
    }
    
    @Published var ecgExports: URL?
    
    private var algorithmViewModel: AlgorithmViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    
    // Internal properties
    
    let importStream: ImportStream
    let exportStream: ExportStream
    
    init(importStream: ImportStream, exportStream: ExportStream) {
        self.importStream = importStream
        self.exportStream = exportStream
    }
    
    
    func processAllECGs() async {
        if let ecg = self.importStream.getNextECG() {
            // do something with
            self.algorithmViewModel = AlgorithmViewModel(ecgSample: ecg)
            if let algorithmViewModel = self.algorithmViewModel{
                await algorithmViewModel.fetchVoltages()
                registerObserver(observable: algorithmViewModel, observer: algorithmViewModel.$canExport)
            }
        } else {
            DispatchQueue.main.async {
                self.ecgExports = self.exportStream.getExportFile()
                self.isExportReady = true
            }
        }
    }
    
    func iteratveOverAllECGs() {
        Task {
           exportECG()
           await processAllECGs()
        }
    }
    
    func exportECG() {
        if let exportResults = algorithmViewModel?.exportResults {
            do {
                try exportStream.exportECG(ecgExport: exportResults)
            } catch {
                #warning("Implement error habdling")
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func registerObserver<T>(observable: AlgorithmViewModel, observer: Published<T>.Publisher) {
        observer
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.iteratveOverAllECGs()
    
            }
        ).store(in: &cancellables)
    }
    
    
    
}
