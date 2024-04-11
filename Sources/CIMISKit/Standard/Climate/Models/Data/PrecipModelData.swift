//
//  Precip.swift
//
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Precip Data
public struct CimisPrecipData: Codable {
 public let providers: [PrecipProviders]
    
    enum CodingKeys: String, CodingKey {
        case providers = "Providers"
    }
}
