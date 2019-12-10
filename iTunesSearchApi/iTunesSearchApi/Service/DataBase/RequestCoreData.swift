//
//  RequestCoreData.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
import CoreData
protocol RequestCoreDataProtocol {
    func saveSearchRecents(context: NSManagedObjectContext,  completion: @escaping(_ success: Bool) -> Void)
    func recoverySearchRecents(context: NSManagedObjectContext, fetchRequest: NSFetchRequest<SearchRecent>, sortBy text: String, fetchDelegate: NSFetchedResultsControllerDelegate, completion: @escaping(_ fetchedResultController: NSFetchedResultsController<SearchRecent>) -> Void)
}

class RequestCoreDataDefault: RequestCoreDataProtocol {
    func saveSearchRecents(context: NSManagedObjectContext, completion: @escaping(_ success: Bool) -> Void) {
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
            completion(false)
        }
        completion(true)
    }
    
    func recoverySearchRecents(context: NSManagedObjectContext, fetchRequest: NSFetchRequest<SearchRecent>, sortBy text: String, fetchDelegate: NSFetchedResultsControllerDelegate, completion: @escaping (NSFetchedResultsController<SearchRecent>) -> Void) {
        
        let fetchedResultController: NSFetchedResultsController<SearchRecent>!
        let sortDescritor = NSSortDescriptor(key: text, ascending: true)
        fetchRequest.sortDescriptors = [sortDescritor]
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = fetchDelegate
        
        do {
            try fetchedResultController.performFetch()
        } catch  {
            print(error.localizedDescription)
        }
        completion(fetchedResultController)
    }
}
