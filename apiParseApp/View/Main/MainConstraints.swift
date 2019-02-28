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
        chartNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
