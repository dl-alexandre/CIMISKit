 //
 //  File.swift
 //
 //
 //  Created by Dalton Alexandre on 12/21/23.
 //

import Foundation
import MapKit

public struct Station: Codable, Identifiable, Hashable {
 public var id = UUID()
 public let stationNbr: String
 public let name, city: String
 public let regionalOffice: RegionalOffice
 public let county, connectDate, disconnectDate: String
 public let isActive, isEtoStation: Is
 public let elevation: String
 public let groundCover: GroundCover
 public let hmsLatitude, hmsLongitude: String
 public let zipCodes: [String]
 public let sitingDesc: String
 
 public var latitude: String {
  String(hmsLatitude[..<(hmsLatitude.firstIndex(of: " ") ?? hmsLatitude.endIndex)])
 }
 
 public var longitude: String {
  String(hmsLongitude[..<(hmsLongitude.firstIndex(of: " ") ?? hmsLongitude.endIndex)])
 }
 
 public var location: CLLocation {
  CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
 }
 
 public var locationDescription: String {
  "\(city), \(county), \(stationNbr)"
 }
 
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

