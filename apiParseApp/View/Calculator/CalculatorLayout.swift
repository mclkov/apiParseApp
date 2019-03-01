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
        setupDismissButton()
        setupBackgroundColor()
    }
    
    func setupBackgroundColor() {
        view.backgroundColor = ColorScheme.darkBlue
    }
    
    func setupDismissButton() {
        dismissButton.setTitle("Return to the Main screen", for: .normal)
        dismissButton.setTitleColor(.white, for: .normal)
        
        dismissButton.addTarget(self, action: #selector(self.dismissButtonPressed), for: .touchUpInside)
        
        view.insertSubview(dismissButton, at: 0)
        dismissButtonAnchors()
    }
}
