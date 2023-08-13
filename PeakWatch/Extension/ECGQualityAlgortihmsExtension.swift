//
//  ECGQualityAlgortihmsExtension.swift
//  PeakWatch
//
//  Created by Nikita Charushnikov on 11.08.23.
//

import Foundation
import PeakSwift

extension ECGQualityAlgorithms: CustomStringConvertible {
    
    var algorithmName: String {
        switch self {
            case .zhao2018(let approach):
                return "Zhao2018"
        }
    }
    
    // For now there should be always a method name
    // In future, it's optional
    var methodName: String? {
        switch self {
        case .zhao2018(let approach):
                switch approach {
                    case .simple:
                        return "Simple"
                    case .fuzzy:
                        return "Fuzzy"
            }
        }
    }
    
    var exportName: String {
        algorithmName + (methodName ?? "")
    }
    
    public var description: String {
        let algorithm = self.algorithmName
        let method = self.methodName
            
        var suffix = ""
            
        if let method = method {
            suffix = " (\(method))"
        }
            
        return algorithm + suffix
    }
    
    
}
