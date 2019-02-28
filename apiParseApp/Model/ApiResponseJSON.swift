//
//  ApiResponseJSON.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

struct ApiResponseJSON: Decodable {
    let time: TimeJSON
    let disclaimer: String
    let chartName: String
    let bpi: [String: CurrencyJSON] // Bitcoin Price Index
}
