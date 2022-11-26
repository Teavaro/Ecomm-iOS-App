//
//  Store.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import Foundation
import SwiftUI

class Store: ObservableObject {

    @Published var listItems: [ShopItem] = []
    @Published var listWish: [ShopItem] = []
    @Published var listCart: [ShopItem] = []
    @Published var listOffer: [ShopItem] = []
    @Published var isLogin = false
    var isFunnelConnectStarted = false
    var isPermissionsValidated = false
    
    var description = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don’t look even slightly believable. If you are going to use a passage of Lorem Ipsum."

    init() {
        listItems.append(ShopItem(id: 0, title: "Jacob’s Baked Crinklys Cheese", description: description,price: 60.00, picture: "crinklys", isOffer: true))
        listItems.append(ShopItem(id: 1, title: "Pork Cocktail Sausages, Pack", description: description, price: 54.00, picture: "pork", isOffer: true, isInStock: false))
        listItems.append(ShopItem(id: 2, title: "Broccoli and Cauliflower Mix", description: description, price: 6.00, picture: "cauliflower"))
        listItems.append(ShopItem(id: 3, title: "Morrisons Creamed Rice Pudding", description: description, price: 44.00, picture: "paprika"))
        listItems.append(ShopItem(id: 4, title: "Fresh For The Bold Ground Amazon", description: description, price: 12.00, picture: "burst"))
        listItems.append(ShopItem(id: 5, title: "Frito-Lay Doritos & Cheetos Mix", description: description, price: 20.00, picture: "watermelon"))
        listItems.append(ShopItem(id: 6, title: "Green Mountain Coffee Roast", description: description, price: 20.00, picture: "grapes"))
        listItems.append(ShopItem(id: 7, title: "Nature’s Bakery Whole Wheat Bars", description: description, price: 50.00, picture: "mixed"))
        updateItemsOffer()
    }

    func addItemToCart(item: ShopItem) {
        if let index = listCart.firstIndex(where: { $0.id == item.id }) {
            listCart[index].countOnCart += 1
        }
        else{
            listCart.append(item)
        }
    }

    func removeItemFromCart(offsets: IndexSet) {
        listCart.remove(atOffsets: offsets)
    }

    func addItemToWish(id: Int) {
        listWish.append(listItems[id])
    }
    
    
    func isItemInWish(item: ShopItem) -> Bool {
        if listWish.firstIndex(of: item) != nil {
            return true
        }
        else{
            return false
        }
    }

    func removeItemFromWish(offsets: IndexSet) {
        listWish.remove(atOffsets: offsets)
    }

    func getTotalPriceCart() -> Float {
        var total: Float = 0
        for item in listCart {
            total += item.price * Float(item.countOnCart)
        }
        return total
    }

    func updateItemsOffer(){
        listOffer = []
        for item in listItems {
            if (item.isOffer){
                listOffer.append(item)
            }
        }
    }

    func removeAllCartItems() {
        listCart.removeAll()
    }
}
