//
//  StorageService.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

class StorageService {
    static let shared = StorageService()
    
    let noDataMessage = "No data available"
    let defaults = UserDefaults.standard
    
    var chartName: String {
        get {
            return defaults.string(forKey: StorageConstants.chartNameKey) ?? noDataMessage
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.chartNameKey)
        }
    }
    var timeUpdated: String {
        get {
            return defaults.string(forKey: StorageConstants.timeUpdatedKey) ?? noDataMessage
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.timeUpdatedKey)
        }
    }
    
    var usdSymbol: String {
        get {
            return defaults.string(forKey: StorageConstants.usdSymbolKey) ?? ""
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.usdSymbolKey)
        }
    }
    
    var usdRate: String {
        get {
            return defaults.string(forKey: StorageConstants.usdRateKey) ?? noDataMessage
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.usdRateKey)
        }
    }
    
    var usdRateFloat: Float {
        get {
            return defaults.string(forKey: StorageConstants.usdRateKey) ?? noDataMessage
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.usdRateKey)
        }
    }
    
    var eurSymbol: String {
        get {
            return defaults.string(forKey: StorageConstants.eurSymbolKey) ?? ""
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.eurSymbolKey)
        }
    }
    
    var eurRate: String {
        get {
            return defaults.string(forKey: StorageConstants.eurRateKey) ?? noDataMessage
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.eurRateKey)
        }
    }
    
    var gbpSymbol: String {
        get {
            return defaults.string(forKey: StorageConstants.gbpSymbolKey) ?? ""
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.gbpSymbolKey)
        }
    }
    
    var gbpRate: String {
        get {
            return defaults.string(forKey: StorageConstants.gbpRateKey) ?? noDataMessage
        }
        
        set {
            defaults.set(newValue, forKey: StorageConstants.gbpRateKey)
        }
    }
}
