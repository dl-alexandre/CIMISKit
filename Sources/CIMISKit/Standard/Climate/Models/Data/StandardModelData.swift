//
//  Standard.swift
//  
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

/// Standard Data
public struct CimisData: Codable {
    let providers: [Providers]
    
    enum CodingKeys: String, CodingKey {
        case providers = "Providers"
    }
}
