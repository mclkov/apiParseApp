//
//  ExchangeRateCell.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class ExchangeRateCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = ColorScheme.darkBlue
    }
    
    func configureCell(exchangeRate: ExchangeRate) {
        
    }
}
