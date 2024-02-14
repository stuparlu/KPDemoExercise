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
    static func loadDescriptionData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
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
        appDelegate!.saveContext()
    }
    
    static func deleteAllData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
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
    
    static func fetchAllDetails() -> [AdDescription]? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AdDescription>(entityName: EntityNames.AdDescription)
        do {
            let entities = try context.fetch(fetchRequest)
            return entities
        } catch {
            print("Error fetching entities: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func fetchDescription(withAdID adID: String) -> AdDescription? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        
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
}
