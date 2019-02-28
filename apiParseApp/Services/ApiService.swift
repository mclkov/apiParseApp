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
    
    func requestData(_ completionHandler: @escaping (_ data: ApiResponseJSON?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let request: WebRequest = WebRequestImpl(website: MainConstants.apiUrl, method: .GET)
            request.execute { (result) in
                guard let data = result else { return }
                guard let jsonData = self.parseJSON(data: data) else { return }
                
                completionHandler(jsonData)
            }
        }
    }
    
    func parseJSON(data: Data) -> ApiResponseJSON? {
        do {
            let jsonData = try JSONDecoder().decode(ApiResponseJSON.self, from: data)
            return jsonData
        } catch let jsonError {
            print("Cannot parse json: ", jsonError)
        }
        
        return nil
    }
}
