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
    
    func instance() -> PageInfo? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PageInfo>(entityName: "PageInfo")
        
        do {
            let resultFetch = try context.fetch(fetchRequest)
            return resultFetch.first
        } catch let fetchError {
            print("Cannot fetch: ", fetchError)
        }
        return nil
    }
    
    func fetchPageInfo() -> PageInfo? {
        if let info = instance() {
            return info
        } else {
            if let info = createPageInfo() {
                return info
            }
        }
        return nil
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
