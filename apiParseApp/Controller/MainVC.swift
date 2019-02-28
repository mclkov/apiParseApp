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
        var timeUpdated = data.time.updated
        if let localTime = data.time.updatedISO.getLocalTimeStringFrom() {
            timeUpdated = localTime
        }
        
        chartNameLabel.text = data.chartName
        timeUpdatedLabel.text = timeUpdated
        
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
            usdSymbolLabel.text = currencySymbol
            usdRateLabel.text = currencyInfo.rate
        case "GBP":
            gbpSymbolLabel.text = currencySymbol
            gbpRateLabel.text = currencyInfo.rate
        case "EUR":
            eurSymbolLabel.text = currencySymbol
            eurRateLabel.text = currencyInfo.rate


        default:
            print("Unknown currency in API response: ", currencyKey)
        }
    }
}

