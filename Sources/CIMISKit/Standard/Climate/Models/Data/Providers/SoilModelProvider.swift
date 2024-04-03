//
//  Soil.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Soil Provider
struct SoilProviders: Codable {
    let name, type, owner: String
    let records: [SoilRecord]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case owner = "Owner"
        case records = "Records"
    }
    
//    static let dailyData: WeatherModel = Bundle.main.decode(file: "weather.json")
}
