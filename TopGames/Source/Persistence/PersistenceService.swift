//
//  PersistenceService.swift
//  TopGames
//
//  Created by Bruno Luiz on 03/08/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import Foundation
import CoreData

//**********************************************************************************************************
//
// MARK: - Definitions - PersistenceServiceProtocol
//
//**********************************************************************************************************

public protocol PersistenceServiceProtocol: class {
    func toNSManagedObject() -> NSManagedObject
    init(NSManagedObject object: NSManagedObject?)
}

//**********************************************************************************************************
//
// MARK: - Class -
//
//**********************************************************************************************************

public final class PersistenceService: NSObject {
    
    //*************************************************
    // MARK: - Properties
    //*************************************************
    
    public lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Top_Games")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public lazy var context: NSManagedObjectContext = {
        return self.container.viewContext
    }()
    
    //*************************************************
    // MARK: - Initializers
    //*************************************************
    
    private override init() { }
    
    public static let shared: PersistenceService = {
        return PersistenceService()
    }()
    
    //*************************************************
    // MARK: - Exposed Methods
    //*************************************************
    
    func saveContext() {
        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
