//
//  Item+CoreDataProperties.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 17/2/23.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: Int16
    @NSManaged public var isOffer: Bool
    @NSManaged public var isInStock: Bool
    @NSManaged public var picture: String?
    @NSManaged public var price: Float
    @NSManaged public var title: String?
    @NSManaged public var isInWish: Bool
    @NSManaged public var countInCart: Int16

}

extension Item : Identifiable {

}
