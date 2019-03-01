//
//  CalculatorService.swift
//  apiParseApp
//
//  Created by McL on 3/1/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

class ExchangeService {
    static let shared = ExchangeService()
    var exchangeRate: Float?
    var direction: Bool?
    
    init(exchangeRate: Float = 1.0, currencyAToCurrencyB: Bool = true) {
        self.exchangeRate = exchangeRate
        self.direction = currencyAToCurrencyB
    }
    
    func calculate() {
        
    }
}
