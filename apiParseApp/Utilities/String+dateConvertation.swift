//
//  DateConverter.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

extension String {
    func getLocalTimeStringFrom() -> String? {
        guard let isoDateToString = self.convertStringToDate() else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm:ss (zzz)"
        
        let date = dateFormatter.string(from: isoDateToString)
        return date
    }
    
    func convertStringToDate() -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: self)
        return date
    }
}
