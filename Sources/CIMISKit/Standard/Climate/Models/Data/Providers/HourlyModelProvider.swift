//
//  Hourly.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Hourly Provider
public struct HrlyProviders: Codable {
 public let name, type, owner: String
 public let records: [HrlyRecord]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case owner = "Owner"
        case records = "Records"
    }
    
//    static let HrlyData: HrlyWeatherModel = Bundle.main.decoded(file: "hrlyweather.json")
//    static let SepFirst: HrlyWeatherModel = Bundle.main.decoded(file: "hrlysepfirst.json")
//    static let SepSecond: HrlyWeatherModel = Bundle.main.decoded(file: "hrlysepsecond.json")
//    static let SepThird: HrlyWeatherModel = Bundle.main.decoded(file: "hrlysepthird.json")
}
