//
//  Hourly.swift
//
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Hourly Record
public struct HrlyRecord: Codable, Identifiable {
 public var id = UUID()
 public var date: Date
 public var julian: String
 public var hour: String
 public var station: String
 public var standard: String
 public var zipCodes: String
 public var scope: Scope
 public var hourlyAirTemp: Measurement?
 public var hourlyDewPoint: Measurement?
 public var hourlyETo: Measurement?
 public var hourlyNetRadiation: Measurement?
 public var hourlyASCEETo: Measurement?
 public var hourlyASCEETr: Measurement?
 public var hourlyPrecipitation: Measurement?
 public var hourlyRelativeHumidity: Measurement?
 public var hourlyResultantWind: Measurement?
 public var hourlySoilTemp: Measurement?
 public var hourlySolarRadiation: Measurement?
 public var hourlyVaporPressure: Measurement?
 public var hourlyWindDirection: Measurement?
 public var hourlyWindSpeed: Measurement?
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case julian = "Julian"
        case hour = "Hour"
        case station = "Station"
        case standard = "Standard"
        case zipCodes = "ZipCodes"
        case scope = "Scope"
        case hourlyAirTemp = "HlyAirTmp"
        case hourlyDewPoint = "HlyDewPnt"
        case hourlyETo = "HlyEto"
        case hourlyNetRadiation = "HlyNetRad"
        case hourlyASCEETo = "HlyAsceEto"
        case hourlyASCEETr = "HlyAsceEtr"
        case hourlyPrecipitation = "HlyPrecip"
        case hourlyRelativeHumidity = "HlyRelHum"
        case hourlyResultantWind = "HlyResWind"
        case hourlySoilTemp = "HlySoilTmp"
        case hourlySolarRadiation = "HlySolRad"
        case hourlyVaporPressure = "HlyVapPres"
        case hourlyWindDirection = "HlyWindDir"
        case hourlyWindSpeed = "HlyWindSpd"
    }
}
