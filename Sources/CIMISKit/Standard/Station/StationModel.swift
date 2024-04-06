//
//  StationModel.swift
//  CIMISPrecip
//
//  Created by Dalton Alexandre on 12/12/23.
//

import Foundation

public struct StationModel: Codable {
    let stations: [Station]
    
    enum CodingKeys: String, CodingKey {
        case stations = "Stations"
    }
}
