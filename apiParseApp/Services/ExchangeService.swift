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
    
    var exchangeRate: Float = 1.0
    var directionAToB: Bool = true
    
    var currencyA: Float = 0.0
    
    func calculate() -> Float {
        if directionAToB {
            return currencyA * exchangeRate
        } else {
            if exchangeRate <= 0 {
                print("Division by 0")
                return 0.0
            }
            return currencyA / exchangeRate
        }
    }
}
