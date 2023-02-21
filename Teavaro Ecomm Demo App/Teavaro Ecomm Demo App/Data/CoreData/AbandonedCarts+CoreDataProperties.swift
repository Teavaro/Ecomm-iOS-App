//
//  AbandonedCarts+CoreDataProperties.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 17/2/23.
//
//

import Foundation
import CoreData


extension AbandonedCarts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AbandonedCarts> {
        return NSFetchRequest<AbandonedCarts>(entityName: "AbandonedCarts")
    }

    @NSManaged public var carts: NSSet?

}

// MARK: Generated accessors for carts
extension AbandonedCarts {

    @objc(addCarts:)
    @NSManaged public func addToCarts(_ values: NSSet)

    @objc(removeCarts:)
    @NSManaged public func removeFromCarts(_ values: NSSet)

}

extension AbandonedCarts : Identifiable {

}
