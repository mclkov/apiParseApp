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
        
        dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
