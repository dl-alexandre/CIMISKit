//
//  Precip.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Precip Provider
public struct PrecipProviders: Codable {
 public let name, type, owner: String
 public let records: [PrecipRecord]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case owner = "Owner"
        case records = "Records"
    }
    
//    static let dailyData: WeatherModel = Bundle.main.decode(file: "weather.json")
}
