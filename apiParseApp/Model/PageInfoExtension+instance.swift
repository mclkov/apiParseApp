//
//  PageInfoExtension+instance.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import CoreData

extension PageInfo {
    func instance() -> PageInfo? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PageInfo>(entityName: "PageInfo")
        
        do {
            let resultFetch = try context.fetch(fetchRequest)
            return resultFetch.first
        } catch let fetchError {
            print("Cannot fetch: ", fetchError)
        }
        return nil
    }
}
