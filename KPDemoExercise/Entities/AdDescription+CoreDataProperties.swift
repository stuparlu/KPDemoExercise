//
//  AdDescription+CoreDataProperties.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//
//

import Foundation
import CoreData


extension AdDescription {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AdDescription> {
        return NSFetchRequest<AdDescription>(entityName: "AdDescription")
    }

    @NSManaged public var ad_id: String?
    @NSManaged public var location_name: String?
    @NSManaged public var cateogry_name: String?
    @NSManaged public var group_name: String?
    @NSManaged public var ad_description: String?
    @NSManaged public var photos: String?

}

extension AdDescription : Identifiable {

}
