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

    func copyrightLabelAnchors() {
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        copyrightLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        copyrightLabel.leadingAnchor.constraint(equalTo: chartNameLabel.leadingAnchor).isActive = true
        copyrightLabel.trailingAnchor.constraint(equalTo: chartNameLabel.trailingAnchor).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func buttonStackViewAnchors() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.bottomAnchor.constraint(equalTo: copyrightLabel.topAnchor, constant: -10).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func updateRequestButtonAnchors() {
        updateRequestButton.translatesAutoresizingMaskIntoConstraints = false
        
        updateRequestButton.widthAnchor.constraint(equalToConstant: MainConstants.buttonSquareSize).isActive = true
        updateRequestButton.heightAnchor.constraint(equalToConstant: MainConstants.buttonSquareSize).isActive = true
    }
    
    func buttonAvailabilityLabelAnchors() {
        buttonAvailabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonAvailabilityLabel.isHidden = true
        
        buttonAvailabilityLabel.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10).isActive = true
        buttonAvailabilityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        buttonAvailabilityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func calculatorButtonAnchors() {
        calculatorButton.translatesAutoresizingMaskIntoConstraints = false
        
        calculatorButton.widthAnchor.constraint(equalToConstant: MainConstants.buttonSquareSize).isActive = true
        calculatorButton.heightAnchor.constraint(equalToConstant: MainConstants.buttonSquareSize).isActive = true
    }
    
    func mainTableViewAnchors() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        mainTableView.topAnchor.constraint(equalTo: timeUpdatedLabel.bottomAnchor, constant: 10).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: buttonAvailabilityLabel.topAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
