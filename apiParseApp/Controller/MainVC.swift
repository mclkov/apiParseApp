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
    
    let usdSymbolLabel = UILabel()
    let gbpSymbolLabel = UILabel()
    let eurSymbolLabel = UILabel()
    
    let usdRateLabel = UILabel()
    let gbpRateLabel = UILabel()
    let eurRateLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
//        fetchApiData()
        setupChartName("BTC")
        setupTimeUpdated(time: "12/12/1990 00:00:00")
        
        setupUsdSymbolLabel(symbol: "$")
        setupUsdRateLabel(value: "100")
    }
    
    func fetchApiData() {
        ApiService.shared.requestData()
    }
}

