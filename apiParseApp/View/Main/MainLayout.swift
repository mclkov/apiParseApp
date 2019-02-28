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
        chartNameLabel.textColor = .white
        chartNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        view.insertSubview(chartNameLabel, at: 0)
        self.chartNameLabelAnchors()
    }
    
    func setupTimeUpdated(time: String) {
        
    }
}
