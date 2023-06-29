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
            case .hamilton:
                return "Hamilton"
        case .hamiltonCleaned:
                return "Hamilton cleaned signal"
        }
    }
}

extension Algorithms: Identifiable {
    public var id: Algorithms {self}
}

