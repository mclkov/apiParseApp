//
//  CalculatorVC.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class CalculatorVC: CustomViewController {
    let dismissButton = UIButton(type: .system)
    
    let btcLabel = UILabel()
    let eurLabel = UILabel()
    let usdLabel = UILabel()
    let gbpLabel = UILabel()
    
    let eurTextField = DecimalTextField()
    let usdTextField = UITextField()
    let gbpTextField = UITextField()
    
    let eurToBtcTextField = UITextField()
    let usdToBtcTextField = UITextField()
    let gbpToBtcTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
