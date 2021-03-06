//
//  ViewController.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit
import CoreData

class MainVC: CustomViewController {
    var mainTableView = UITableView()
    
    var pageInfo: PageInfo?
    var exchangeRates = [ExchangeRate]()
    
    let chartNameLabel = UILabel()
    let timeUpdatedLabel = UILabel()
    
    let buttonStackView = UIStackView()
    let buttonAvailabilityLabel = UILabel()
    let calculatorButton = UIButton()
    
    let updateRequestButton = UIButton()
    let copyrightLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
        setupTableViewDelegateAndDataSource()
        addNotificationsForKeyboardBehaviour()
        fetchCoreDataStorage()
    }
    
    func addNotificationsForKeyboardBehaviour() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupTableViewDelegateAndDataSource() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func fetchCoreDataStorage() {
        fetchPageInfoAndUpdateUI()
        fetchExchangeRatesAndUpdateUI()
    }
    
    func fetchPageInfoAndUpdateUI() {
        pageInfo = CoreDataManager.shared.fetchPageInfo()
        
        guard let pageInfo = pageInfo else { return }
        guard let updatedTimeDate = pageInfo.timeUpdated else { return }
        
        chartNameLabel.text = pageInfo.chartName
        timeUpdatedLabel.text = updatedTimeDate.getLocalTimeString()
    }
    
    func fetchExchangeRatesAndUpdateUI() {
        exchangeRates = CoreDataManager.shared.fetchExchangeRates()
        mainTableView.reloadData()
    }
    
    func updatePageInfo(_ info: PageInfoProperties) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        guard let pageInfo = pageInfo else { return }
        
        pageInfo.chartName = info.chartName
        pageInfo.timeUpdated = info.timeUpdated
        
        do {
            try context.save()
        } catch let saveError {
            print("Failed to update info: ", saveError)
        }
    }
    
    func fetchApiData(completionHandler: @escaping () -> Void) {
        ApiService.shared.requestData { (data) in
            guard let jsonData = data else {
                self.connectionIssueCase()
                return
            }
            
            DispatchQueue.main.async {
                self.saveApiDataToCoreData(data: jsonData)
                self.fetchCoreDataStorage()
                completionHandler()
            }
        }
    }
    
    func connectionIssueCase() {
        DispatchQueue.main.async {
            self.showAlert(title: "Connection issue", message: "The internet connection appears to be offline")
            self.stopUpdateSequence()
        }
    }
    
    func saveApiDataToCoreData(data: ApiResponseJSON) {
        var timeUpdated: Date?
        if let localTime = data.time.updatedISO.convertStringToDate() {
            timeUpdated = localTime
        }
        
        let info = PageInfoProperties()
        info.chartName = data.chartName
        info.timeUpdated = timeUpdated
        
        updatePageInfo(info)
        updateExchangeRates(currencies: data.bpi)
    }
    
    func updateExchangeRates(currencies: [String: CurrencyJSON]) {
        CoreDataManager.shared.resetExchangeRates()
        saveExchangeRatesToLocalStorage(currencies: currencies)
    }

    func saveExchangeRatesToLocalStorage(currencies: [String: CurrencyJSON]) {
        CoreDataManager.shared.persistentContainer.performBackgroundTask { (backgroundContext) in
            
            for (currencyKey, currencyInfo) in currencies {
                var currencySymbol = ""
                if let htmlToUtf8 = currencyInfo.symbol.htmlToUtf8() {
                    currencySymbol = htmlToUtf8
                }
                
                let exchange = ExchangeRate(context: backgroundContext)
                exchange.code = currencyInfo.code.lowercased()
                exchange.symbol = currencySymbol
                exchange.rate = currencyInfo.rate
                exchange.rateFloat = currencyInfo.rateFloat
            }
            
            do {
                try backgroundContext.save()
                
                DispatchQueue.main.async {
                    self.fetchCoreDataStorage()
                }
            } catch let error {
                print("Failed to save backgroundContext: ", error)
            }
        }
    }
    
    @objc func presentCalculatorVC() {
        let calculatorVC = CalculatorVC()
        present(calculatorVC, animated: true, completion: nil)
    }
    
    @objc func updateRequestButtonPressed() {
        startUpdateSequence()
        self.fetchApiData {
            self.stopUpdateSequenceWithQueryDelay()
        }
    }
}

