//
//  CalculatorConstraints.swift
//  apiParseApp
//
//  Created by McL on 3/1/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension CalculatorVC {
    func dismissButtonAnchors() {
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func eurLabelAnchors() {
        eurLabel.translatesAutoresizingMaskIntoConstraints = false
        
        eurLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CalculatorConstants.topSpace).isActive = true
        eurLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CalculatorConstants.columnSpace).isActive = true
        eurLabel.widthAnchor.constraint(equalToConstant: CalculatorConstants.currencyLabelWidth).isActive = true
    }
    
    func eurTextFieldAnchors() {
        eurTextField.translatesAutoresizingMaskIntoConstraints = false
        
        eurTextField.topAnchor.constraint(equalTo: eurLabel.bottomAnchor, constant: CalculatorConstants.columnSpace).isActive = true
        eurTextField.leadingAnchor.constraint(equalTo: eurLabel.leadingAnchor).isActive = true
        eurTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -CalculatorConstants.columnSpace).isActive = true
    }
    
    func btcLabelAnchors() {
        btcLabel.translatesAutoresizingMaskIntoConstraints = false
        
        btcLabel.topAnchor.constraint(equalTo: eurLabel.topAnchor).isActive = true
        btcLabel.leadingAnchor.constraint(equalTo: eurTextField.trailingAnchor, constant: CalculatorConstants.columnSpace).isActive = true
        btcLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CalculatorConstants.columnSpace).isActive = true
    }
    
    func eurToBtcTextFieldAnchors() {
        eurToBtcTextField.translatesAutoresizingMaskIntoConstraints = false
        
        eurToBtcTextField.topAnchor.constraint(equalTo: btcLabel.bottomAnchor, constant: CalculatorConstants.columnSpace).isActive = true
        eurToBtcTextField.leadingAnchor.constraint(equalTo: btcLabel.leadingAnchor).isActive = true
        eurToBtcTextField.trailingAnchor.constraint(equalTo: btcLabel.trailingAnchor).isActive = true
    }
    

    
    func usdLabelAnchors() {
        usdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usdLabel.topAnchor.constraint(equalTo: eurTextField.bottomAnchor, constant: CalculatorConstants.topSpace).isActive = true
        usdLabel.leadingAnchor.constraint(equalTo: eurLabel.leadingAnchor).isActive = true
        usdLabel.widthAnchor.constraint(equalToConstant: CalculatorConstants.currencyLabelWidth).isActive = true
    }
    
    func usdTextFieldAnchors() {
        usdTextField.translatesAutoresizingMaskIntoConstraints = false
        
        usdTextField.topAnchor.constraint(equalTo: usdLabel.bottomAnchor, constant: CalculatorConstants.columnSpace).isActive = true
        usdTextField.leadingAnchor.constraint(equalTo: usdLabel.leadingAnchor).isActive = true
        usdTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -CalculatorConstants.columnSpace).isActive = true
    }
    
    func usdToBtcTextFieldAnchors() {
        usdToBtcTextField.translatesAutoresizingMaskIntoConstraints = false
        
        usdToBtcTextField.topAnchor.constraint(equalTo: btcLabel.bottomAnchor, constant: CalculatorConstants.columnSpace).isActive = true
        usdToBtcTextField.leadingAnchor.constraint(equalTo: btcLabel.leadingAnchor).isActive = true
        usdToBtcTextField.trailingAnchor.constraint(equalTo: btcLabel.trailingAnchor).isActive = true
    }
}
