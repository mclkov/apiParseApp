//
//  MainLayout.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
    func startUpdateSequence() {
        startUpdateButtonSpinning()
        disableUpdateButton()
    }
    
    func startUpdateButtonSpinning() {
        updateRequestButton.rotate360Degrees()
    }
    
    func disableUpdateButton() {
        updateRequestButton.isEnabled = false
    }
    
    func stopUpdateSequenceWithQueryDelay() {
        stopUpdateButtonSpinning()
        DispatchQueue.main.asyncAfter(deadline: .now() + MainConstants.delayInSecondsBetweenQueries) {
            self.enableUpdateButton()
        }
    }
    
    func stopUpdateSequence() {
        stopUpdateButtonSpinning()
        self.enableUpdateButton()
    }
    
    func stopUpdateButtonSpinning() {
        updateRequestButton.layer.removeAnimation(forKey: MainConstants.animationKey)
    }
    
    func enableUpdateButton() {
        updateRequestButton.isEnabled = true
    }
    
    func setupView() {
        setupBackgroundColor()
        
        setupTopLabels()
        setupExchangeRateLabels()
        
        setupCopyringsLabel()
        setupUpdateRequestButton()
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
}
