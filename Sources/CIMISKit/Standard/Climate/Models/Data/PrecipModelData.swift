//
//  Precip.swift
//
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Precip Data
struct CimisPrecipData: Codable {
    let providers: [PrecipProviders]
    
    enum CodingKeys: String, CodingKey {
        case providers = "Providers"
    }
}
