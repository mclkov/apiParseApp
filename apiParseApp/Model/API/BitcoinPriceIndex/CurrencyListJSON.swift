//
//  CurrencyList.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

struct CurrencyListJSON: Decodable {
    let USD: USDCurrencyJSON
    let GBP: GBPCurrencyJSON
    let EUR: EURCurrencyJSON
}
