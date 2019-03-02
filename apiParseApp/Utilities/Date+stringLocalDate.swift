//
//  Date+stringLocalDate.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

extension Date {
    func getLocalTimeString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm:ss (zzz)"
        
        let date = dateFormatter.string(from: self)
        return date
    }
}
