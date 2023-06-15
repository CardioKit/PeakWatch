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
            case .Christov:
                return "Christov"
            case .WQRS:
                return "WQRS"
            case .Nabian2018:
                return "Nabian"
            case .Aristotle:
                return "Aristotle"
            case .Basic:
                return "Basic"
            case .GQRS:
                return "GQRS"
        }
    }
}

extension Algorithms: Identifiable {
    public var id: Algorithms {self}
}

