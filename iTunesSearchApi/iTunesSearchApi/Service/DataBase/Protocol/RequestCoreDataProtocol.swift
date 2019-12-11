//
//  RequestCoreDataProtocol.swift
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
