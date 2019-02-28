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
            
            DispatchQueue.main.async {
                self.showData(data: jsonData)
            }
        }
    }
    
    func showData(data: ApiResponseJSON) {
        setupChartName(data.chartName)
        setupTimeUpdated(time: data.time.updated)
        processExchangeRates(currencies: data.bpi)
    }
    
    func processExchangeRates(currencies: [String: CurrencyJSON]) {
        for (key, value) in currencies {
            showExchangeRatesFor(currencyKey: key, currencyInfo: value)
        }
    }
    
    func showExchangeRatesFor(currencyKey: String, currencyInfo: CurrencyJSON) {
        var currencySymbol = ""
        if let htmlToUtf8 = currencyInfo.symbol.htmlToUtf8() {
            currencySymbol = htmlToUtf8
        }
        
        switch currencyKey {
        case "USD":
            setupUsdSymbolLabel(symbol: currencySymbol)
            setupUsdRateLabel(value: currencyInfo.rate)
//        case "GBP":
//            setupGbpSymbolLabel(symbol: currencySymbol)
//            setupGbpRateLabel(value: currencyInfo.rate)
//        case "EUR":
//            setupEurSymbolLabel(symbol: currencySymbol)
//            setupEurRateLabel(value: currencyInfo.rate)


        default:
            print("Unknown currency in API response: ", currencyKey)
        }
    }
}

