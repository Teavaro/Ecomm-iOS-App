//
//  CartItem+CoreDataProperties.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 13/2/23.
//
//

import Foundation
import CoreData


extension CartItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItem> {
        return NSFetchRequest<CartItem>(entityName: "CartItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var cart: AbandonedCart?

}

extension CartItem : Identifiable {

}
