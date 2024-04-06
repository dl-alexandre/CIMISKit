//
//  Soil.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Soil Data
public struct CimisSoilData: Codable {
    let providers: [SoilProviders]
    
    enum CodingKeys: String, CodingKey {
        case providers = "Providers"
    }
}
