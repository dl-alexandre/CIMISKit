//
//  Is.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

enum Is: String, Codable {
    case isFalse = "False"
    case isTrue = "True"
    
    init() {
        self = .isFalse
    }
}

extension Is: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.isTrue,.isTrue), (.isFalse,.isFalse):
            return true
        default:
            return false
        }
    }
}

extension Is: ExpressibleByBooleanLiteral {
    init(booleanLiteral value: BooleanLiteralType) {
        self = value ? .isTrue : .isFalse
    }
}

extension Is {
    var boolValue: Bool {
        switch self {
        case .isTrue:
            return true
        case .isFalse:
            return false
        }
    }
}
