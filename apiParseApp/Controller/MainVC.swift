//
//  ViewController.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .green
        fetchApiData()
    }
    
    func fetchApiData() {
        ApiService.shared.requestData()
    }
}

