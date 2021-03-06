//
//  ExchangeRateLabel.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class ExchangeRateLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeView() {
        textColor = .white
        font = UIFont(name: CalculatorConstants.calculatorFont, size: 20)
    }
}
