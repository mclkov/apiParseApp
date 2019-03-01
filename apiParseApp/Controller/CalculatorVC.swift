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
    let scrollView = UIScrollView()
    
    let btcLabel = CurrencyLabel()
    let eurLabel = CurrencyLabel()
    let usdLabel = CurrencyLabel()
    let gbpLabel = CurrencyLabel()
    
    let eurTextField = DecimalTextField()
    let usdTextField = DecimalTextField()
    let gbpTextField = DecimalTextField()
    
    let eurToBtcTextField = DecimalTextField()
    let usdToBtcTextField = DecimalTextField()
    let gbpToBtcTextField = DecimalTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        setupEvents()
    }
    
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupEvents() {
        eurTextField.name = "eur"
        eurTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        usdTextField.name = "usd"
        usdTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        gbpTextField.name = "gbp"
        gbpTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        eurToBtcTextField.name = "eurToBtc"
        eurToBtcTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        usdToBtcTextField.name = "usdToBtc"
        usdToBtcTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        gbpToBtcTextField.name = "gbpToBtc"
        gbpToBtcTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: DecimalTextField) {
        print(textField.text)
        print(textField.name)
    }
}
