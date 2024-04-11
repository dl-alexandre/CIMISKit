//
//  Hourly.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Hourly Data
public struct HrlyCimisData: Codable {
 public let providers: [HrlyProviders]
    
    enum CodingKeys: String, CodingKey {
        case providers = "Providers"
    }
}
