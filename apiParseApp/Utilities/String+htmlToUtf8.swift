//
//  String+htmlToUtf8.swift
//  apiParseApp
//
//  Created by McL on 2/28/19.
//  Copyright © 2019 McL. All rights reserved.
//

import Foundation

extension String {
    func htmlToUtf8() -> String? {
        let encodedString = self
        guard let data = encodedString.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            let decodedString = attributedString.string
            
            return decodedString
        } catch let error {
            print("Cannot create attributed string: ", error)
        }
        
        return nil
    }
}
