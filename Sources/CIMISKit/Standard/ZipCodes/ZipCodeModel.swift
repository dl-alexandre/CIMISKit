//
//  ZipCodeModel.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation


struct ZipCodeModel: Codable {
    let zipCodes: [ZipCode]

    enum CodingKeys: String, CodingKey {
        case zipCodes = "ZipCodes"
    }
}
