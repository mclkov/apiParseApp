//
//  Currency.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

class CurrencyJSON: Decodable {
    var code: String = ""
    var symbol: String = ""
    var rate: String = ""
    var description: String = ""
    var rateFloat: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case
            code,
            symbol,
            rate,
            description,
            rateFloat = "rate_float"
    }
}
