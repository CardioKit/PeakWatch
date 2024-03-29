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
    
    var totalECGsToProcess: Double? = nil
    
    @Published var isError: String? = nil
    
    @Published var amountOfECGProcess: Double = 0
    
    @Published var processTime: Duration = Duration.zero

    
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
        do  {
            if let ecg = try self.importStream.getNextECG() {
                self.algorithmViewModel = AlgorithmViewModel(ecgSample: ecg)
                if let algorithmViewModel = self.algorithmViewModel{
                    await algorithmViewModel.fetchVoltages()
                    registerObserver(observable: algorithmViewModel, observer: algorithmViewModel.$canExport)
                }
            } else {
                DispatchQueue.main.async {
                    do {
                        self.ecgExports = try self.exportStream.getExportFile()
                        self.isExportReady = true
                    } catch {
                        self.errorHandler(error: error)
                    }
                }
            }
        } catch {
            errorHandler(error: error)
        }
    }
    
    func exportECG() {
        if let exportResults = algorithmViewModel?.exportResults {
            do {
                
                try exportStream.exportECG(ecgExport: exportResults)
                
                DispatchQueue.main.async {
                    self.processTime += exportResults.runtime
                }
        
            } catch {
                errorHandler(error: error)
            }
        }
    }
    
    private func iteratveOverAllECGs() {
        Task {
           exportECG()
           incrementAmountOfECGs()
           await processAllECGs()
        }
    }
    
    private func registerObserver<T>(observable: AlgorithmViewModel, observer: Published<T>.Publisher) {
        observer
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.iteratveOverAllECGs()
    
            }
        ).store(in: &cancellables)
    }
    
    private func incrementAmountOfECGs() {
        DispatchQueue.main.async {
            self.amountOfECGProcess += 1
        }
     
    }
    
    private func errorHandler(error: Error) {
        DispatchQueue.main.async {
            self.isError = error.localizedDescription
        }
    }
    
    
}
