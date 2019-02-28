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
    
    func setupChartNameLabel() {
        chartNameLabel.textColor = ColorScheme.transparentGold
        chartNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        view.insertSubview(chartNameLabel, at: 0)
        self.chartNameLabelAnchors()
    }
    
    func setupTimeUpdatedLabel() {
        timeUpdatedLabel.textColor = ColorScheme.transparentWhite
        timeUpdatedLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        view.insertSubview(timeUpdatedLabel, at: 0)
        self.timeUpdatedLabelAnchors()
    }
    
    
    //
    func setupUsdSymbolLabel() {
        usdSymbolLabel.textColor = .white
        
        view.insertSubview(usdSymbolLabel, at: 0)
        self.usdSymbolLabelAnchors()
    }
    
    func setupUsdRateLabel() {
        usdRateLabel.textColor = .white
        
        view.insertSubview(usdRateLabel, at: 0)
        self.usdRateLabelAnchors()
    }
    //
    
    //
    func setupEurSymbolLabel() {
        eurSymbolLabel.textColor = .white
        
        view.insertSubview(eurSymbolLabel, at: 0)
        self.eurSymbolLabelAnchors()
    }
    
    func setupEurRateLabel() {
        eurRateLabel.textColor = .white
        
        view.insertSubview(eurRateLabel, at: 0)
        self.eurRateLabelAnchors()
    }
    //
    
    //
    func setupGbpSymbolLabel() {
        gbpSymbolLabel.textColor = .white
        
        view.insertSubview(gbpSymbolLabel, at: 0)
        self.gbpSymbolLabelAnchors()
    }
    
    func setupGbpRateLabel() {
        gbpRateLabel.textColor = .white
        
        view.insertSubview(gbpRateLabel, at: 0)
        self.gbpRateLabelAnchors()
    }
    //
}
