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
    
    let updateRequestButton = UIButton()
    let copyrightLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
        fetchLocalStorageData()
    }

    func fetchLocalStorageData() {
        let storage = StorageService.shared
        
        chartNameLabel.text = storage.chartName
        timeUpdatedLabel.text = storage.timeUpdated
        
        usdSymbolLabel.text = storage.usdSymbol
        usdRateLabel.text = storage.usdRate
        
        eurSymbolLabel.text = storage.eurSymbol
        eurRateLabel.text = storage.eurRate
        
        gbpSymbolLabel.text = storage.gbpSymbol
        gbpRateLabel.text = storage.gbpRate
    }
    
    @objc func updateRequestButtonPressed() {
        startUpdateSequence()
        self.fetchApiData {
            self.stopUpdateSequenceWithDelay()
        }
    }
    
    func fetchApiData(completionHandler: @escaping () -> Void) {
        ApiService.shared.requestData { (data) in
            guard let jsonData = data else {
                self.connectionIssueCase()
                return
            }
            
            DispatchQueue.main.async {
                self.saveApiDataToLocalStorage(data: jsonData)
                self.fetchLocalStorageData()
                completionHandler()
            }
        }
    }
    
    func connectionIssueCase() {
        DispatchQueue.main.async {
            self.showAlert(title: "Connection issue", message: "The internet connection appears to be offile")
            self.stopUpdateSequence()
        }
    }
    
    func saveApiDataToLocalStorage(data: ApiResponseJSON) {
        let storage = StorageService.shared
        
        var timeUpdated = data.time.updated
        if let localTime = data.time.updatedISO.getLocalTimeStringFrom() {
            timeUpdated = localTime
        }
        
        storage.chartName = data.chartName
        storage.timeUpdated = timeUpdated
        
        saveExchangeRatesToLocalStorage(currencies: data.bpi)
    }
    
    func saveExchangeRatesToLocalStorage(currencies: [String: CurrencyJSON]) {
        for (key, value) in currencies {
            saveExchangeRateFor(currencyKey: key, currencyInfo: value)
        }
    }
    
    func saveExchangeRateFor(currencyKey: String, currencyInfo: CurrencyJSON) {
        let storage = StorageService.shared
        
        var currencySymbol = ""
        if let htmlToUtf8 = currencyInfo.symbol.htmlToUtf8() {
            currencySymbol = htmlToUtf8
        }
        
        switch currencyKey {
        case "USD":
            storage.usdSymbol = currencySymbol
            storage.usdRate = currencyInfo.rate
        case "GBP":
            storage.gbpSymbol = currencySymbol
            storage.gbpRate = currencyInfo.rate
        case "EUR":
            storage.eurSymbol = currencySymbol
            storage.eurRate = currencyInfo.rate
        default:
            print("Unknown currency in API response: ", currencyKey)
        }
    }
    
    
    
    
    
    
    func showData(data: ApiResponseJSON) {
        var timeUpdated = data.time.updated
        if let localTime = data.time.updatedISO.getLocalTimeStringFrom() {
            timeUpdated = localTime
        }
        
        chartNameLabel.text = data.chartName
        timeUpdatedLabel.text = timeUpdated
        
//        processExchangeRates(currencies: data.bpi)
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

