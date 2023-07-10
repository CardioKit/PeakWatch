//
//  Algorithms.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import Foundation
import PeakSwift

extension Algorithms: RawRepresentable {
    
   
    public typealias RawValue = String
    
    public init?(rawValue: String) {
        switch rawValue {
        case Algorithms.christov.rawValue:
            self = .christov
        case Algorithms.wqrs.rawValue:
            self = .wqrs
        case Algorithms.nabian2018.rawValue:
            self = .nabian2018
        case Algorithms.aristotle.rawValue:
            self = .aristotle
        case Algorithms.basic.rawValue:
            self = .basic
        case Algorithms.gqrs.rawValue:
            self = .gqrs
        case Algorithms.hamilton.rawValue:
            self = .hamilton
        case Algorithms.panTompkins.rawValue:
            self = .panTompkins
        case Algorithms.twoAverage.rawValue:
            self = .twoAverage
        case Algorithms.hamiltonCleaned.rawValue:
            self = .hamiltonCleaned
        default:
            return nil
        }
    }

    public var rawValue: String {
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
            case .panTompkins:
                return "Pan Tompkins"
            case .twoAverage:
                return "Two Average"
            case .hamiltonCleaned:
                return "Hamilton cleaned signal"
        }
    }
}

extension Algorithms: Identifiable {
    public var id: Algorithms {self}
}

extension Algorithms: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}

//extension Algorithms: Codable {
//    
//}

