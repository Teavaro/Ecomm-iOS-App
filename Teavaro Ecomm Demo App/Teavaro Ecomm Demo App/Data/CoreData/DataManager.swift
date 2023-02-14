//
//  DataManager.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 13/2/23.
//

import Foundation
import CoreData

class DataManager {
  static let shared = DataManager()
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "CoreDataRelationship")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  //Core Data Saving support
  func save () {
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
    
    func abandonedCart(id: Int16) -> AbandonedCart {
      let abandonedCart = AbandonedCart(context: persistentContainer.viewContext)
        abandonedCart.id = id
      return abandonedCart
    }
    func cartItem(name: String, abandonedCart: AbandonedCart) -> CartItem {
      let cartItem = CartItem(context: persistentContainer.viewContext)
        cartItem.name = name
        abandonedCart.addToItems(cartItem)
      return cartItem
    }
    func items(abandonedCart: AbandonedCart) -> [CartItem] {
      let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
      request.predicate = NSPredicate(format: "abandonedCart = %@", abandonedCart)
      var fetchedItems: [CartItem] = []
      do {
          fetchedItems = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching itemstems \(error)")
      }
      return fetchedItems
    }
    
}
