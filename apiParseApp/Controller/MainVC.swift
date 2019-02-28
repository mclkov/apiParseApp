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
        fetchApiData()
    }
    
    func fetchApiData() {
        ApiService.shared.requestData { (data) in
            guard let jsonData = data else { return }
            self.showData(data: jsonData)
        }
    }
    
    func showData(data: ApiResponseJSON) {
        setupChartName(data.chartName)
        setupTimeUpdated(time: data.time.updated)
        
        setupUsdSymbolLabel(symbol: "$")
        setupUsdRateLabel(value: "100")
        
        setupEurSymbolLabel(symbol: "#")
        setupEurRateLabel(value: "120")
        
        setupGbpSymbolLabel(symbol: "@")
        setupGbpRateLabel(value: "130")
    }
}

