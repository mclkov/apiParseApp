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
        guard let currency = textField.text else { return }
        guard let currencyFloat = Float(currency) else { return }
        
        let operation = textField.name
        calculateExchangeRate(operation: operation, currencyAmount: currencyFloat)
    }
    
    func getOperationKey(_ operation: String) -> String {
        if operation.count < 3 {
            return ""
        }
        
        let codeIndex = operation.index(operation.startIndex, offsetBy: 3)
        return String(operation[..<codeIndex])
    }
    
    func calculateExchangeRate(operation: String, currencyAmount: Float) {
        let storage = CoreDataManager.shared
        let calculator = ExchangeService()
        
        let exchangeRates: [String: Float] = storage.fetchExchangeRatesForCalculator()
        let operation3LetterCode = getOperationKey(operation)
        guard let exchangeRate = exchangeRates[operation3LetterCode] else { return }
        
        calculator.currencyA = currencyAmount
        calculator.exchangeRate = exchangeRate
        
        switch operation {
        case "eur":
            calculator.directionAToB = false
            eurToBtcTextField.text = String(calculator.calculate())
        case "usd":
            calculator.directionAToB = false
            usdToBtcTextField.text = String(calculator.calculate())
        case "gbp":
            calculator.directionAToB = false
            gbpToBtcTextField.text = String(calculator.calculate())
        case "eurToBtc":
            eurTextField.text = String(calculator.calculate())
        case "usdToBtc":
            usdTextField.text = String(calculator.calculate())
        case "gbpToBtc":
            gbpTextField.text = String(calculator.calculate())
        default:
            print("Unknown currency: ", operation)
        }
    }
}
