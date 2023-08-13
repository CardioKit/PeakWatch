//
//  Algorithms.swift
//  PeakWatch
//
//  Created by x on 12.06.23.
//

import Foundation
import PeakSwift
import SwiftUI

extension Algorithms: RawRepresentable {
    
   
    public typealias RawValue = String
    
    public init?(rawValue: String) {
        switch rawValue {
        case Algorithms.christov.rawValue:
            self = .christov
        case Algorithms.engzee.rawValue:
            self = .engzee
        case Algorithms.nabian2018.rawValue:
            self = .nabian2018
        case Algorithms.aristotle.rawValue:
            self = .aristotle
        case Algorithms.basic.rawValue:
            self = .basic
        case Algorithms.kalidas.rawValue:
            self = .kalidas
        case Algorithms.hamilton.rawValue:
            self = .hamilton
        case Algorithms.panTompkins.rawValue:
            self = .panTompkins
        case Algorithms.twoAverage.rawValue:
            self = .twoAverage
        case Algorithms.unsw.rawValue:
            self = .unsw
        case Algorithms.neurokit.rawValue:
            self = .neurokit
        default:
            return nil
        }
    }

    public var rawValue: String {
        switch self {
            case .christov:
                return "Christov"
            case .nabian2018:
                return "Nabian"
            case .aristotle:
                return "Aristotle"
            case .basic:
                return "Basic"
            case .hamilton:
                return "Hamilton"
            case .panTompkins:
                return "Pan Tompkins"
            case .twoAverage:
                return "Two Average"
            case .neurokit:
                return "NeuroKit"
            case .unsw:
                return "UNSW"
            case .engzee:
                return "Engzee"
            case .kalidas:
                return "Kalidas"
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

extension Algorithms {
    
    var color: Color {
        switch self {
        case .basic:
            return .brown
        case .aristotle:
            return .black
        case .christov:
            return .blue
        case .engzee:
            return .gray
        case .kalidas:
            return .mint
        case .nabian2018:
            return .purple
        case .hamilton:
            return .orange
        case .unsw:
            return .yellow
        case .twoAverage:
            return .pink
        case .neurokit:
            return .cyan
        case .panTompkins:
            return .green
        }
    }
}
