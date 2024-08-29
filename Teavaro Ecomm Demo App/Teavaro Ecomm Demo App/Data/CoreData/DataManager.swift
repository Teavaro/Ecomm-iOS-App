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
    let container = NSPersistentContainer(name: "Teavaro_Ecomm_Demo_App")
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
    
    func addItem(id: Int16, title: String, desc: String, price: Float, picture: String, data: String, isOffer: Bool = false, isInStock: Bool = false) {
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: persistentContainer.viewContext)
        let item = Item(entity: entity!, insertInto: persistentContainer.viewContext)
        item.id = id
        item.title = title
        item.desc = desc
        item.price = price
        item.picture = picture
        item.data = data
        item.isOffer = isOffer
        item.isInStock = isInStock
        item.countInCart = 0
        save()
    }
    
    func getItems() -> [Item] {
      let request: NSFetchRequest<Item> = Item.fetchRequest()
      var fetchedItems: [Item] = []
      do {
          fetchedItems = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching items \(error)")
      }
      return fetchedItems
    }
    
    func getWishItems() -> [Item] {
      let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "isInWish == %i", true)
      var fetchedItems: [Item] = []
      do {
          fetchedItems = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching items \(error)")
      }
      return fetchedItems
    }
    
    func getCartItems() -> [Item] {
      let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "countInCart > %i", 0)
      var fetchedItems: [Item] = []
      do {
          fetchedItems = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching items \(error)")
      }
      return fetchedItems
    }
    
    func getOfferItems() -> [Item] {
      let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "isOffer == %i", true)
      var fetchedItems: [Item] = []
      do {
          fetchedItems = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching items \(error)")
      }
      return fetchedItems
    }
    
    func clearData() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        var fetchedItems: [Item] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            for item in fetchedItems {
                persistentContainer.viewContext.delete(item)
            }
            save()
        } catch let error {
          print("Error fetching items \(error)")
        }
    }
    
    func clearAbandonedCarts() {
        let request: NSFetchRequest<AbandonedCarts> = AbandonedCarts.fetchRequest()
        var fetchedItems: [AbandonedCarts] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            for item in fetchedItems {
                persistentContainer.viewContext.delete(item)
            }
            save()
        } catch let error {
          print("Error fetching items \(error)")
        }
    }
    
    func addItemToCart(itemId: Int16){
        doOnItem(itemId: itemId, action: { item in
            item.countInCart += 1
        })
    }
    
    func addItemToWish(itemId: Int16){
        doOnItem(itemId: itemId, action: { item in
            item.isInWish = true
        })
    }
    
    func doOnItem(itemId: Int16, action: ((_ item: Item) -> Void)){
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", itemId)
        var fetchedItems: [Item] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            if let item = fetchedItems.first{
                action(item)
                save()
            }
        } catch let error {
          print("Error fetching items \(error)")
        }
    }
    
    func clearCart(){
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        var fetchedItems: [Item] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            for item in fetchedItems{
                item.countInCart = 0
            }
            save()
        } catch let error {
          print("Error fetching items \(error)")
        }
    }
    
    func addAbandonedCart(items: [Item]) -> Int{
        let entity = NSEntityDescription.entity(forEntityName: "AbandonedCarts", in: persistentContainer.viewContext)
        let cart = AbandonedCarts(entity: entity!, insertInto: persistentContainer.viewContext)
        cart.id = getUniqueId()
        for item in items {
            cart.addToItems(item)
        }
        save()
        return cart.id
    }
    
    func getAbandonedCarts() -> [AbandonedCarts] {
      let request: NSFetchRequest<AbandonedCarts> = AbandonedCarts.fetchRequest()
      var fetchedItems: [AbandonedCarts] = []
      do {
          fetchedItems = try persistentContainer.viewContext.fetch(request)
      } catch let error {
        print("Error fetching items \(error)")
      }
      return fetchedItems
    }
    
    func getAbandonedCartItems(itemId: Int) -> [Item] {
      let request: NSFetchRequest<AbandonedCarts> = AbandonedCarts.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", itemId)
      var fetchedCarts: [AbandonedCarts] = []
        var fetchedItems: [Item] = []
      do {
          fetchedCarts = try persistentContainer.viewContext.fetch(request)
          if let cart = fetchedCarts.first{
              fetchedItems = cart.items?.allObjects as! [Item]
          }
      } catch let error {
        print("Error fetching items \(error)")
      }
        return fetchedItems
    }
    
    func removeItemFromCart(itemId: Int16){
        doOnItem(itemId: itemId, action: { item in
            item.countInCart = 0
        })
    }
    
    func removeItemFromWish(itemId: Int16){
        doOnItem(itemId: itemId, action: { item in
            item.isInWish = false
        })
    }
    
    func getItem(itemId: Int16) -> Item?{
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", itemId)
        var fetchedItems: [Item] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            if let item = fetchedItems.first{
                return item
            }
        } catch let error {
          print("Error fetching items \(error)")
        }
        return nil
    }
    
    func getUniqueId() -> Int{
        let uniqueId = Int(String(UUID().hashValue).prefix(5)) ?? 0
        if(uniqueId < 0){
            return uniqueId * -1
        }
        else{
            return uniqueId
        }
    }
}
