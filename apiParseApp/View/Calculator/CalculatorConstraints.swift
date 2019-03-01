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
        
        eurLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        eurLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        eurLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func eurTextFieldAnchors() {
        eurTextField.translatesAutoresizingMaskIntoConstraints = false
        
        eurTextField.topAnchor.constraint(equalTo: eurLabel.bottomAnchor, constant: CalculatorConstants.topSpace).isActive = true
        eurTextField.leadingAnchor.constraint(equalTo: eurLabel.leadingAnchor).isActive = true
        eurTextField.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
}
