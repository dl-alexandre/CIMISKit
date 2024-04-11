//
//  Standard.swift
//
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Standard Model
public struct WeatherModel: Codable {
 public let cimisData: CimisData
    
    enum CodingKeys: String, CodingKey {
        case cimisData = "Data"
    }
}
