//
//  VillagerSaved+CoreDataProperties.swift
//  VillagerTracker
//
//  Created by Helena Oliveira on 19/10/22.
//
//

import Foundation
import CoreData


extension VillagerSaved {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VillagerSaved> {
        return NSFetchRequest<VillagerSaved>(entityName: "VillagerSaved")
    }

    @NSManaged public var icon: String?
    @NSManaged public var name: String?

}

extension VillagerSaved : Identifiable {

}
