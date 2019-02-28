//
//  MainConstraints.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
    func chartNameLabelAnchors() {
        chartNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let sideBorderPadding:CGFloat = 16
        
        chartNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        chartNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideBorderPadding).isActive = true
        chartNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideBorderPadding).isActive = true
        chartNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func timeUpdatedLabelAnchors() {
        timeUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeUpdatedLabel.topAnchor.constraint(equalTo: chartNameLabel.bottomAnchor).isActive = true
        timeUpdatedLabel.leadingAnchor.constraint(equalTo: chartNameLabel.leadingAnchor).isActive = true
        timeUpdatedLabel.trailingAnchor.constraint(equalTo: chartNameLabel.trailingAnchor).isActive = true
        timeUpdatedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func usdSymbolLabelAnchors() {
        usdSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usdSymbolLabel.topAnchor.constraint(equalTo: timeUpdatedLabel.bottomAnchor, constant: 20).isActive = true
        usdSymbolLabel.leadingAnchor.constraint(equalTo: chartNameLabel.leadingAnchor).isActive = true
        usdSymbolLabel.widthAnchor.constraint(equalToConstant: MainConstants.rateLabelWidth).isActive = true
        usdSymbolLabel.heightAnchor.constraint(equalToConstant: MainConstants.rateLabelHeight).isActive = true
    }
    
    func usdRateLabelAnchors() {
        usdRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usdRateLabel.topAnchor.constraint(equalTo: usdSymbolLabel.topAnchor).isActive = true
        usdRateLabel.leadingAnchor.constraint(equalTo: usdSymbolLabel.trailingAnchor).isActive = true
        usdRateLabel.trailingAnchor.constraint(equalTo: chartNameLabel.trailingAnchor).isActive = true
        usdRateLabel.heightAnchor.constraint(equalToConstant: MainConstants.rateLabelHeight).isActive = true
    }
    
}
