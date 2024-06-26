//
//  Soil.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Soil Record
public struct SoilRecord: Codable, Identifiable {
 public let id = UUID()
 public let date: Date
 public let julian: String
 public let station: String
 public let standard: String
 public let zipCodes: String
 public let scope: Scope
//    let dailyAirTmpAvg: sureVQU
//    let dailyAirTmpMax: sureVQU
//    let dailyAirTmpMin: sureVQU
//    let dailyDewPoint: sureVQU
//    let dailyEto: VQU
//    let dailyAsceEto: sureVQU
//    let dailyAsceEtr: VQU
//    let dailyPrecip: sureVQU
//    let dailyRelHumAvg: sureVQU
//    let dailyRelHumMax: sureVQU
//    let dailyRelHumMin: sureVQU
 public let dailySoilTmpAvg: Measurement
 public let dailySoilTmpMax: Measurement
 public let dailySoilTmpMin: Measurement
//    let dailySolarRadiationAvg: sureVQU
//    let dailySolarRadiationNet: VQU
//    let dailyVaporPressureAvg: sureVQU
//    let dailyVaporPressureMax: VQU
//    let dailyWindEastNorthEast: VQU
//    let dailyWindEastSouthEast: VQU
//    let dailyWindNorthNorthEast: VQU
//    let dailyWindNorthNorthWest: VQU
//    let dailyWindRun: sureVQU
//    let dailyWindSpeedAvg: sureVQU
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
//        case dailyAirTmpAvg = "DayAirTmpAvg"
//        case dailyAirTmpMax = "DayAirTmpMax"
//        case dailyAirTmpMin = "DayAirTmpMin"
//        case dailyDewPoint = "DayDewPnt"
//        case dailyEto = "DayEto"
//        case dailyAsceEto = "DayAsceEto"
//        case dailyAsceEtr = "DayAsceEtr"
//        case dailyPrecip = "DayPrecip"
//        case dailyRelHumAvg = "DayRelHumAvg"
//        case dailyRelHumMax = "DayRelHumMax"
//        case dailyRelHumMin = "DayRelHumMin"
        case dailySoilTmpAvg = "DaySoilTmpAvg"
        case dailySoilTmpMax = "DaySoilTmpMax"
        case dailySoilTmpMin = "DaySoilTmpMin"
//        case dailySolarRadiationAvg = "DaySolRadAvg"
//        case dailySolarRadiationNet = "DaySolRadNet"
//        case dailyVaporPressureAvg = "DayVapPresAvg"
//        case dailyVaporPressureMax = "DayVapPresMax"
//        case dailyWindEastNorthEast = "DayWindEne"
//        case dailyWindEastSouthEast = "DayWindEse"
//        case dailyWindNorthNorthEast = "DayWindNne"
//        case dailyWindNorthNorthWest = "DayWindNnw"
//        case dailyWindRun = "DayWindRun"
//        case dailyWindSpeedAvg = "DayWindSpdAvg"
//        case dailyWindSouthSouthWest = "DayWindSsw"
//        case dailyWindWestNorthWest = "DayWindWnw"
//        case dailyWindWestSouthWest = "DayWindWsw"
    }
}
