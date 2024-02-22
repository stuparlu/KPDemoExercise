//
//  PersistenceManager.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation
import UIKit
import CoreData

struct PersistenceManager {
    static let shared = PersistenceManager()
    var persistentContainer: NSPersistentContainer
    
    private init() {
        self.persistentContainer = NSPersistentContainer(name: "KPDemoExercise")
        self.persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    
    func loadDescriptionData() {
        let context = self.persistentContainer.viewContext
        let loadedData = JsonDataLoader.loadAdDescription()
        for item in loadedData {
            let description = AdDescription(context: context)
            description.ad_id = item.ad_id
            description.location_name = item.location_name
            description.cateogry_name = item.cateogry_name
            description.group_name = item.group_name
            description.ad_description = item.description
            description.photos = item.photos
        }
        self.saveContext()
    }
    
    func deleteAllData() {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityNames.AdDescription)
        do {
            let entities = try context.fetch(fetchRequest)
            for case let entity as NSManagedObject in entities {
                context.delete(entity)
            }
            try context.save()
        } catch {
            print("Error deleting entities: \(error.localizedDescription)")
        }
    }
    
    func fetchAllDetails() -> [AdDescription]? {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AdDescription>(entityName: EntityNames.AdDescription)
        do {
            let entities = try context.fetch(fetchRequest)
            return entities
        } catch {
            print("Error fetching entities: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchDescription(withAdID adID: String) -> AdDescription? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<AdDescription>(entityName: EntityNames.AdDescription)
        fetchRequest.predicate = NSPredicate(format: "ad_id == %@", adID)
        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            print("Error fetching item: \(error.localizedDescription)")
            return nil
        }
    }
        
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
