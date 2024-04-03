//
//  Precip.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Precip Provider
struct PrecipProviders: Codable {
    let name, type, owner: String
    let records: [PrecipRecord]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case owner = "Owner"
        case records = "Records"
    }
    
//    static let dailyData: WeatherModel = Bundle.main.decode(file: "weather.json")
}
