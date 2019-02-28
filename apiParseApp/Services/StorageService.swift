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
    }
    var timeUpdated: String {
        get {
            return defaults.string(forKey: StorageConstants.timeUpdatedKey) ?? noDataMessage
        }
    }
}
