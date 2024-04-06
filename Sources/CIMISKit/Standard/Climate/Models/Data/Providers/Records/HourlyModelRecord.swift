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
    var date: Date
    var julian: String
    var hour: String
    var station: String
    var standard: String
    var zipCodes: String
    var scope: Scope
    var hourlyAirTemp: Measurement?
    var hourlyDewPoint: Measurement?
    var hourlyETo: Measurement?
    var hourlyNetRadiation: Measurement?
    var hourlyASCEETo: Measurement?
    var hourlyASCEETr: Measurement?
    var hourlyPrecipitation: Measurement?
    var hourlyRelativeHumidity: Measurement?
    var hourlyResultantWind: Measurement?
    var hourlySoilTemp: Measurement?
    var hourlySolarRadiation: Measurement?
    var hourlyVaporPressure: Measurement?
    var hourlyWindDirection: Measurement?
    var hourlyWindSpeed: Measurement?
    
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
