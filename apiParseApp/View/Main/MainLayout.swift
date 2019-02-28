//
//  MainLayout.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
    func setupView() {
        setupBackgroundColor()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    func setupChartName(_ name: String) {
        chartNameLabel.text = name
        chartNameLabel.textColor = ColorScheme.transparentGold
        chartNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        view.insertSubview(chartNameLabel, at: 0)
        self.chartNameLabelAnchors()
    }
    
    func setupTimeUpdated(time: String) {
        timeUpdatedLabel.text = time
        timeUpdatedLabel.textColor = ColorScheme.transparentWhite
        timeUpdatedLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        view.insertSubview(timeUpdatedLabel, at: 0)
        self.timeUpdatedLabelAnchors()
    }
    
    func setupUsdSymbolLabel(symbol: String) {
        usdSymbolLabel.text = symbol
        usdSymbolLabel.textColor = .white
        
        view.insertSubview(usdSymbolLabel, at: 0)
        self.usdSymbolLabelAnchors()
    }
    
    func setupUsdRateLabel(value: String) {
        usdRateLabel.text = value
        usdRateLabel.textColor = .white
        
        view.insertSubview(usdRateLabel, at: 0)
        self.usdRateLabelAnchors()
    }
}
