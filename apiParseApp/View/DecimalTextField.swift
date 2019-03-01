//
//  DecimalTextField.swift
//  apiParseApp
//
//  Created by McL on 3/1/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class DecimalTextField: UITextField {
    let padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settings()
        customizeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func settings() {
        doneAccessory = true
        keyboardType = .decimalPad
    }
    
    func customizeView() {
        layer.cornerRadius = 5
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        textColor = .white
        textAlignment = .left
        font = UIFont(name: CalculatorConstants.calculatorFont, size: 20)
        
        if let p = placeholder
        {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: UIColor.white])
            attributedPlaceholder = place
            textColor = UIColor.white
        }
    }
}
