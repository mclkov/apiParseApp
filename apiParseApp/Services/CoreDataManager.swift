//
//  CoreDataService.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescritpion, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        return container
    }()
    
    func fetchPageInfo() -> PageInfo {
        var pageInfo = PageInfo()
        if let info = pageInfo.instance() {
            pageInfo = info
        } else {
            if let info = createPageInfo() {
                pageInfo = info
            }
        }
        
        return pageInfo
    }
    
    func createPageInfo() -> PageInfo? {
        let context = persistentContainer.viewContext
        let managedObject = NSEntityDescription.insertNewObject(forEntityName: "PageInfo", into: context)
        guard let pageInfo = managedObject as? PageInfo else {
            print("Cannot cast managedObject to pageInfo")
            return nil
        }
        
        pageInfo.chartName = nil
        pageInfo.timeUpdated = nil
        
        do {
            try context.save()
            return pageInfo
        } catch let saveError {
            print("Failed to create pageInfo: ", saveError)
            return nil
        }
    }
}
