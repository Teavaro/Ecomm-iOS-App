//
//  AbandonedCart+CoreDataProperties.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 13/2/23.
//
//

import Foundation
import CoreData


extension AbandonedCart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AbandonedCart> {
        return NSFetchRequest<AbandonedCart>(entityName: "AbandonedCart")
    }

    @NSManaged public var id: Int16
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension AbandonedCart {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: CartItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: CartItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension AbandonedCart : Identifiable {

}
