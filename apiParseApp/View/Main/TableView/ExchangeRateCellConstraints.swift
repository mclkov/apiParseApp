//
//  ExchangeRateCellConstraints.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension ExchangeRateCell {
    func symbolLabelAnchors() {
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        symbolLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        symbolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        symbolLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        symbolLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
