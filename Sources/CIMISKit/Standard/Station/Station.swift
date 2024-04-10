 //
 //  File.swift
 //
 //
 //  Created by Dalton Alexandre on 12/21/23.
 //

import Foundation
import MapKit

public struct Station: Codable, Identifiable, Hashable {
 public static func == (lhs: Station, rhs: Station) -> Bool {
   // Compare relevant properties for equality
  return lhs.stationNbr == rhs.stationNbr
  && lhs.name == rhs.name
  && lhs.city == rhs.city
  && lhs.regionalOffice == rhs.regionalOffice
  && lhs.county == rhs.county
  && lhs.connectDate == rhs.disconnectDate
  && lhs.disconnectDate == rhs.disconnectDate
  && lhs.isActive == rhs.isActive
  && lhs.isEtoStation == rhs.isEtoStation
  && lhs.elevation == rhs.elevation
  && lhs.groundCover == rhs.groundCover
  && lhs.hmsLatitude == rhs.hmsLatitude
  && lhs.hmsLongitude == rhs.hmsLongitude
  && lhs.zipCodes == rhs.zipCodes
  && lhs.sitingDesc == rhs.sitingDesc
   // Add other properties as needed
 }
 
 public func hash(into hasher: inout Hasher) {
   // Combine relevant properties into the hasher
  hasher.combine(stationNbr)
  hasher.combine(name)
  hasher.combine(city)
  hasher.combine(regionalOffice)
  hasher.combine(county)
  hasher.combine(connectDate)
  hasher.combine(disconnectDate)
  hasher.combine(isActive)
  hasher.combine(isEtoStation)
  hasher.combine(elevation)
  hasher.combine(groundCover)
  hasher.combine(hmsLatitude)
  hasher.combine(hmsLongitude)
  hasher.combine(zipCodes)
  hasher.combine(sitingDesc)
   // Add other properties as needed
 }
 
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

