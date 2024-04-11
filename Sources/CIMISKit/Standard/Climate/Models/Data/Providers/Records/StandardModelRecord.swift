//
//  Standard.swift
//  CIMISPrecip
//
//  Created by Dalton Alexandre on 12/12/23.
//

import Foundation

/// Standard Record
public struct Record: Codable, Identifiable {
 public let id = UUID()
 public let date: Date
 public let julian: String
 public let station: String
 public let standard: String
 public let zipCodes: String
 public let scope: Scope
 public let dailyAirTmpAvg: Measurement
 public let dailyAirTmpMax: Measurement
 public let dailyAirTmpMin: Measurement
 public let dailyDewPoint: Measurement
//  public   let dailyEto: VQU
 public let dailyAsceEto: Measurement
//  public   let dailyAsceEtr: VQU
 public let dailyPrecip: Measurement
 public let dailyRelHumAvg: Measurement
 public let dailyRelHumMax: Measurement
 public let dailyRelHumMin: Measurement
 public let dailySoilTmpAvg: Measurement
//    let dailySoilTmpMax: VQU
//    let dailySoilTmpMin: VQU
 public let dailySolarRadiationAvg: Measurement
//    let dailySolarRadiationNet: VQU
 public let dailyVaporPressureAvg: Measurement
//    let dailyVaporPressureMax: VQU
//    let dailyWindEastNorthEast: VQU
//    let dailyWindEastSouthEast: VQU
//    let dailyWindNorthNorthEast: VQU
//    let dailyWindNorthNorthWest: VQU
 public let dailyWindRun: Measurement
 public let dailyWindSpeedAvg: Measurement
//    let dailyWindSouthSouthWest: VQU
//    let dailyWindWestNorthWest: VQU
//    let dailyWindWestSouthWest: VQU
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case julian = "Julian"
        case station = "Station"
        case standard = "Standard"
        case zipCodes = "ZipCodes"
        case scope = "Scope"
        case dailyAirTmpAvg = "DayAirTmpAvg"
        case dailyAirTmpMax = "DayAirTmpMax"
        case dailyAirTmpMin = "DayAirTmpMin"
        case dailyDewPoint = "DayDewPnt"
//        case dailyEto = "DayEto"
        case dailyAsceEto = "DayAsceEto"
//        case dailyAsceEtr = "DayAsceEtr"
        case dailyPrecip = "DayPrecip"
        case dailyRelHumAvg = "DayRelHumAvg"
        case dailyRelHumMax = "DayRelHumMax"
        case dailyRelHumMin = "DayRelHumMin"
        case dailySoilTmpAvg = "DaySoilTmpAvg"
//        case dailySoilTmpMax = "DaySoilTmpMax"
//        case dailySoilTmpMin = "DaySoilTmpMin"
        case dailySolarRadiationAvg = "DaySolRadAvg"
//        case dailySolarRadiationNet = "DaySolRadNet"
        case dailyVaporPressureAvg = "DayVapPresAvg"
//        case dailyVaporPressureMax = "DayVapPresMax"
//        case dailyWindEastNorthEast = "DayWindEne"
//        case dailyWindEastSouthEast = "DayWindEse"
//        case dailyWindNorthNorthEast = "DayWindNne"
//        case dailyWindNorthNorthWest = "DayWindNnw"
        case dailyWindRun = "DayWindRun"
        case dailyWindSpeedAvg = "DayWindSpdAvg"
//        case dailyWindSouthSouthWest = "DayWindSsw"
//        case dailyWindWestNorthWest = "DayWindWnw"
//        case dailyWindWestSouthWest = "DayWindWsw"
    }
}
