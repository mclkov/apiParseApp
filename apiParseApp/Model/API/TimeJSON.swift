//
//  TimeJSON.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

struct TimeJSON: Decodable {
    let update: String
    let updatedISO: String
    let updateduk: String
    let bpi: [CurrencyJSON]
}
