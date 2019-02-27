//
//  ApiService.swift
//  apiParseApp
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

enum RequestMethod: String {
    case GET
    case POST
}

protocol WebRequest {
    init(website: String, method: RequestMethod)
    func setPath(_ path: String)
    func execute(completionHandler: @escaping (_ result: Data?) -> Void)
}

class ApiService {
    static let shared = ApiService()
}
