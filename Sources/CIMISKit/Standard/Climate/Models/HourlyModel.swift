//
//  Hourly.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Hourly Model
public struct HrlyWeatherModel: Codable {
 public let cimisData: HrlyCimisData
    
    enum CodingKeys: String, CodingKey {
        case cimisData = "Data"
    }
}
