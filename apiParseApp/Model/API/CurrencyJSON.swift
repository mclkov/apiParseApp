//
//  Currency.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

struct CurrencyJSON: Decodable {
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let rateFloat: Double
    
    private enum CodingKeys: String, CodingKey {
        case
            code,
            symbol,
            rate,
            description,
            rateFloat = "rate_float"
    }
}
