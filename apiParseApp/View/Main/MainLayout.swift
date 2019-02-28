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
        
        setupTopLabels()
        setupExchangeRateLabels()
        
        setupCopyringsLabel()
        setupUpdateRequestButton()
        setupButtonAvailabilityLabel()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    func setupTopLabels() {
        setupChartNameLabel()
        setupTimeUpdatedLabel()
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
    
    func setupExchangeRateLabels() {
        setupUsdSymbolLabel()
        setupUsdRateLabel()
        
        setupEurSymbolLabel()
        setupEurRateLabel()
        
        setupGbpSymbolLabel()
        setupGbpRateLabel()
    }
    
    func setupCopyringsLabel() {
        copyrightLabel.text = MainConstants.copyrights
        copyrightLabel.textColor = .white
        copyrightLabel.textAlignment = .center
        copyrightLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.insertSubview(copyrightLabel, at: 0)
        self.copyrightLabelAnchors()
    }
    
    func setupUpdateRequestButton() {
        let backgroundImage = UIImage(named: "reload")
        updateRequestButton.setImage(backgroundImage, for: .normal)
        updateRequestButton.addTarget(self, action: #selector(self.updateRequestButtonPressed), for: .touchUpInside)
        
        view.insertSubview(updateRequestButton, at: 0)
        self.updateRequestButtonAnchors()
    }
    
    func setupButtonAvailabilityLabel() {
        buttonAvailabilityLabel.text = MainConstants.buttonAvailability
        buttonAvailabilityLabel.textColor = .white
        copyrightLabel.textAlignment = .center
        buttonAvailabilityLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.insertSubview(buttonAvailabilityLabel, at: 0)
        self.buttonAvailabilityLabelAnchors()
    }
    
    func setupCalculatorButton() {
        let backgroundImage = UIImage(named: "calculator")
        calculatorButton.setImage(backgroundImage, for: .normal)
        calculatorButton.addTarget(self, action: #selector(self.presentCalculatorVC), for: .touchUpInside)
        
        view.insertSubview(calculatorButton, at: 0)
        self.calculatorButtonAnchors()
    }
}
