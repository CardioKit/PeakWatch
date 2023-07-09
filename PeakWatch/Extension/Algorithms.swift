//
//  Algorithms.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import Foundation
import PeakSwift

extension Algorithms: CustomStringConvertible {
    public var description: String {
        switch self {
            case .christov:
                return "Christov"
            case .wqrs:
                return "WQRS"
            case .nabian2018:
                return "Nabian"
            case .aristotle:
                return "Aristotle"
            case .basic:
                return "Basic"
            case .gqrs:
                return "GQRS"
            case .neurokit:
                return "NeuroKit"
            default:
                return "unknown"
    
        }
    }
}

extension Algorithms: Identifiable {
    public var id: Algorithms {self}
}

