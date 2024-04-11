//
//  Soil.swift
//  CIMIS
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Soil Model
public struct WeatherSoilModel: Codable {
 public let cimisData: CimisSoilData
    
    enum CodingKeys: String, CodingKey {
        case cimisData = "Data"
    }
}
