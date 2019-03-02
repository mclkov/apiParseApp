//
//  ViewController.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

class MainVC: CustomViewController {
    var pageInfo: PageInfo?
    var exchangeRates: [ExchangeRate]?
    
    let chartNameLabel = UILabel()
    let timeUpdatedLabel = UILabel()
    
    let usdSymbolLabel = UILabel()
    let gbpSymbolLabel = UILabel()
    let eurSymbolLabel = UILabel()
    
    let usdRateLabel = UILabel()
    let gbpRateLabel = UILabel()
    let eurRateLabel = UILabel()
    
    
    let buttonStackView = UIStackView()
    let buttonAvailabilityLabel = UILabel()
    let calculatorButton = UIButton()
    
    let updateRequestButton = UIButton()
    let copyrightLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
        self.setupView()
        fetchLocalStorageData()
        
        
        
        fetchCoreDataStorage()
        
//        let info = PageInfo()
//        info.chartName = "Test"
//        info.timeUpdated = nil
//        updatePageInfo(info)
//        
//        if let localInfo = pageInfo {
//            print(localInfo.chartName)
//        }
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
        pageInfo = CoreDataManager.shared.fetchPageInfo()
    }
    
    func updatePageInfo(_ info: PageInfo) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        pageInfo = info
        
        do {
            try context.save()
        } catch let saveError {
            print("Failed to update info: ", saveError)
        }
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
            self.showAlert(title: "Connection issue", message: "The internet connection appears to be offline")
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
        
        storage.saveExchangeRatesToLocalStorage(currencies: data.bpi)
    }
}

