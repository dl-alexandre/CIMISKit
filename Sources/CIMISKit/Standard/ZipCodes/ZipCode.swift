//
//  File.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation


struct ZipCode: Codable {
    let stationNbr: Int
    let zipCode, connectDate, disconnectDate: String
    let isActive: Is

    enum CodingKeys: String, CodingKey {
        case stationNbr = "StationNbr"
        case zipCode = "ZipCode"
        case connectDate = "ConnectDate"
        case disconnectDate = "DisconnectDate"
        case isActive = "IsActive"
    }
}
