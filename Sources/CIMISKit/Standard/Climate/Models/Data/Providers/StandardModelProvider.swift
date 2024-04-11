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
 public let name, type, owner: String
 public let records: [Record]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case owner = "Owner"
        case records = "Records"
    }
    
//    static let dailyData: WeatherModel = Bundle.main.decode(file: "weather.json")
}
