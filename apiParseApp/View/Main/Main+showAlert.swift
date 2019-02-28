//
//  MainVC+showAlert.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertActionOk)
        
        present(alertController, animated: true, completion: nil)
    }
}
