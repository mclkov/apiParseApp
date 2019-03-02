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
        
        setupCopyringsLabel()
        setupUpdateRequestButton()
        setupCalculatorButton()
        setupButtonStackView()
        
        setupButtonAvailabilityLabel()
        setupMainTableView()
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
        
        self.updateRequestButtonAnchors()
    }
    
    func setupCalculatorButton() {
        let backgroundImage = UIImage(named: "calculator")
        calculatorButton.setImage(backgroundImage, for: .normal)
        calculatorButton.addTarget(self, action: #selector(self.presentCalculatorVC), for: .touchUpInside)
        
        self.calculatorButtonAnchors()
    }
    
    func setupButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.spacing = 10
        
        buttonStackView.addArrangedSubview(updateRequestButton)
        buttonStackView.addArrangedSubview(calculatorButton)
        
        view.insertSubview(buttonStackView, at: 0)
        self.buttonStackViewAnchors()
    }
    
    func setupButtonAvailabilityLabel() {
        buttonAvailabilityLabel.text = MainConstants.buttonAvailability
        buttonAvailabilityLabel.textColor = .white
        copyrightLabel.textAlignment = .center
        buttonAvailabilityLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        view.insertSubview(buttonAvailabilityLabel, at: 0)
        self.buttonAvailabilityLabelAnchors()
    }
    
    func setupMainTableView() {
        mainTableView.separatorStyle = .none
        mainTableView.backgroundColor = ColorScheme.darkBlue
        
        view.insertSubview(mainTableView, at: 0)
        self.mainTableViewAnchors()
        self.registerCellReuseId()
    }
}
