//
//  Standard.swift
//  CIMIS
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

// MARK: - Providers
/// Standard Provider
public struct Providers: Codable {
    let name, type, owner: String
    let records: [Record]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case owner = "Owner"
        case records = "Records"
    }
    
//    static let dailyData: WeatherModel = Bundle.main.decode(file: "weather.json")
}
