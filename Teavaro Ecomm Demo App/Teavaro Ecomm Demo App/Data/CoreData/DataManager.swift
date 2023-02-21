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
    
    func addItem(id: Int16, title: String, desc: String, price: Float, picture: String, isOffer: Bool = false, isInStock: Bool = false) {
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: persistentContainer.viewContext)
        let item = Item(entity: entity!, insertInto: persistentContainer.viewContext)
        item.id = id
        item.title = title
        item.desc = desc
        item.price = price
        item.picture = picture
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
    
    func clearData(){
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
    
    func addItemToCart(itemId: Int16){
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", itemId)
        var fetchedItems: [Item] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            if let item = fetchedItems.first{
                item.countInCart += 1
                save()
            }
        } catch let error {
          print("Error fetching items \(error)")
        }
    }
    
    func addItemToWish(itemId: Int16){
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", itemId)
        var fetchedItems: [Item] = []
        do {
            fetchedItems = try persistentContainer.viewContext.fetch(request)
            if let item = fetchedItems.first{
                item.isInWish = true
                save()
            }
        } catch let error {
          print("Error fetching items \(error)")
        }
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
}
