//
//  Precip.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Precip Model
public struct WeatherPrecipModel: Codable {
 public let cimisData: CimisPrecipData
    
    enum CodingKeys: String, CodingKey {
        case cimisData = "Data"
    }
}
