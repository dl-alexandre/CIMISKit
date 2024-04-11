//
//  Measurement.swift
//
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

public struct Measurement: Codable {
 public let value: String?
 public let qc: String
 public let unit: Unit
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case qc = "Qc"
        case unit = "Unit"
    }
}
