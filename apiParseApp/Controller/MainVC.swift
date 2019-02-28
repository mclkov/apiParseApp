//
//  ViewController.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class MainVC: CustomViewController {
    let chartNameLabel = UILabel()
    let timeUpdatedLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
//        fetchApiData()
        setupChartName("BTC")
        setupTimeUpdated(time: "12/12/1990 00:00:00")
    }
    
    func fetchApiData() {
        ApiService.shared.requestData()
    }
}

