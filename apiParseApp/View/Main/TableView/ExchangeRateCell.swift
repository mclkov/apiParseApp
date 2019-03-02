//
//  ExchangeRateCell.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class ExchangeRateCell: UITableViewCell {
    let symbolLabel = ExchangeRateLabel()
    let rateLabel = ExchangeRateLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupBackgroundColor()
        setupSelectionStyle()
        setupSymbolLabel()
        setupRateLabel()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = ColorScheme.darkBlue
    }
    
    private func setupSelectionStyle() {
        selectionStyle = .none
    }
    
    private func setupSymbolLabel() {
        addSubview(symbolLabel)
        symbolLabelAnchors()
    }
    
    private func setupRateLabel() {
        addSubview(rateLabel)
        rateLabelAnchors()
    }
    
    func configureCell(exchangeRate: ExchangeRate) {
        symbolLabel.text = exchangeRate.symbol
        rateLabel.text = exchangeRate.rate
    }
}
