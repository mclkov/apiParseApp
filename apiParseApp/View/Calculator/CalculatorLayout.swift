//
//  CalculatorLayout.swift
//  apiParseApp
//
//  Created by McL on 3/1/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CalculatorVC {
    func setupView() {
        setupScrollView()
        setupBackgroundColor()
        
        setupDismissButton()
        
        setupEurLabel()
        setupEurTextField()
        setupBtcLabel()
        setupEurToBtcTextField()

        setupUsdLabel()
        setupUsdTextField()
        setupUsdToBtcTextField()
        
        setupGbpLabel()
        setupGbpTextField()
        setupGbpToBtcTextField()
    }
    
    func setupScrollView() {
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height+CalculatorConstants.doneButtonHeight)
        
        view.insertSubview(scrollView, at: 0)
        self.scrollViewAnchors()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
        scrollView.backgroundColor = ColorScheme.darkBlue
    }
    
    func setupDismissButton() {
        dismissButton.setTitle("Return to the Main screen", for: .normal)
        dismissButton.setTitleColor(.white, for: .normal)
        
        dismissButton.addTarget(self, action: #selector(self.dismissButtonPressed), for: .touchUpInside)
        
        scrollView.insertSubview(dismissButton, at: 0)
        dismissButtonAnchors()
    }
    
    func setupEurLabel() {
        eurLabel.text = "Eur"

        scrollView.addSubview(eurLabel)
        self.eurLabelAnchors()
    }
    
    func setupEurTextField() {
        scrollView.insertSubview(eurTextField, at: 0)
        self.eurTextFieldAnchors()
    }
    
    func setupBtcLabel() {
        btcLabel.text = "BTC"
        
        scrollView.insertSubview(btcLabel, at: 0)
        self.btcLabelAnchors()
    }
    
    func setupEurToBtcTextField() {
        scrollView.insertSubview(eurToBtcTextField, at: 0)
        self.eurToBtcTextFieldAnchors()
    }
    
    
    func setupUsdLabel() {
        usdLabel.text = "Usd"
        
        scrollView.insertSubview(usdLabel, at: 0)
        self.usdLabelAnchors()
    }
    
    func setupUsdTextField() {
        scrollView.insertSubview(usdTextField, at: 0)
        self.usdTextFieldAnchors()
    }

    func setupUsdToBtcTextField() {
        scrollView.insertSubview(usdToBtcTextField, at: 0)
        self.usdToBtcTextFieldAnchors()
    }
    
    func setupGbpLabel() {
        gbpLabel.text = "Gbp"
        
        scrollView.insertSubview(gbpLabel, at: 0)
        self.gbpLabelAnchors()
    }
    
    func setupGbpTextField() {
        scrollView.insertSubview(gbpTextField, at: 0)
        self.gbpTextFieldAnchors()
    }

    func setupGbpToBtcTextField() {
        scrollView.insertSubview(gbpToBtcTextField, at: 0)
        self.gbpToBtcTextFieldAnchors()
    }
}
