//
//  MainLayout+ExchangeRateLabelsConstraints.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
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
