//
//  File.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation

public struct Station: Codable, Identifiable, Hashable {
 public var id = UUID()
    public let stationNbr: String 
    let name, city: String
    let regionalOffice: RegionalOffice
    let county, connectDate, disconnectDate: String
    let isActive, isEtoStation: Is
    let elevation: String
    let groundCover: GroundCover
    let hmsLatitude, hmsLongitude: String
    let zipCodes: [String]
    let sitingDesc: String

    enum CodingKeys: String, CodingKey {
        case stationNbr = "StationNbr"
        case name = "Name"
        case city = "City"
        case regionalOffice = "RegionalOffice"
        case county = "County"
        case connectDate = "ConnectDate"
        case disconnectDate = "DisconnectDate"
        case isActive = "IsActive"
        case isEtoStation = "IsEtoStation"
        case elevation = "Elevation"
        case groundCover = "GroundCover"
        case hmsLatitude = "HmsLatitude"
        case hmsLongitude = "HmsLongitude"
        case zipCodes = "ZipCodes"
        case sitingDesc = "SitingDesc"
    }
}

