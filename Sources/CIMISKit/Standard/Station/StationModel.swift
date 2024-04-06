//
//  StationModel.swift
//  CIMISPrecip
//
//  Created by Dalton Alexandre on 12/12/23.
//

import Foundation

public struct StationModel: Codable {
 public let stations: [Station]
    
    enum CodingKeys: String, CodingKey {
        case stations = "Stations"
    }
 
 public init(from decoder: Decoder) throws {
  let container = try decoder.container(keyedBy: CodingKeys.self)
  stations = try container.decode([Station].self, forKey: .stations)
 }
}
