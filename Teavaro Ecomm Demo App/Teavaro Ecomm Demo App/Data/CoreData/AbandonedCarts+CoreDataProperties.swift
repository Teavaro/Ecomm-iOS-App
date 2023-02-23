//
//  AbandonedCarts+CoreDataProperties.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 22/2/23.
//
//

import Foundation
import CoreData


extension AbandonedCarts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AbandonedCarts> {
        return NSFetchRequest<AbandonedCarts>(entityName: "AbandonedCarts")
    }

    @NSManaged public var id: Int
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension AbandonedCarts {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension AbandonedCarts : Identifiable {

}
