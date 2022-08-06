//
//  Store.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI

class Store {

    private var listItems: [ShopItem] = []
    var isLogin = false
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
    }

    func addItemToCart(id: Int) {
        listItems[id].countOnCart += 1
    }

    func removeItemFromCart(id: Int) {
        listItems[id].countOnCart = 0
    }

    func addItemToWish(id: Int) {
        listItems[id].isWish = true
    }

    func removeItemFromWish(id: Int) {
        listItems[id].isWish = false
    }

    func getItems() -> Array<ShopItem> {
        return listItems
    }

    func getItemsCart() -> Array<ShopItem> {
        var listCart: [ShopItem] = []
        for item in listItems {
            if (item.countOnCart > 0){
                listCart.append(item)
            }
        }
        return listCart
    }

    func getItemsWish() -> Array<ShopItem> {
        var listWish: [ShopItem] = []
        for item in listItems {
            if (item.isWish){
                listWish.append(item)
            }
        }
        return listWish
    }

    func getTotalPriceCart() -> Float {
        var total: Float = 0
        for item in listItems {
            total += item.price * Float(item.countOnCart)
        }
        return total
    }

    func getItemsOffer() -> Array<ShopItem> {
        var listOffer: [ShopItem] = []
        for item in listItems {
            if (item.isOffer){
                listOffer.append(item)
            }
        }
        return listOffer
    }

    func removeAllCartItems() {
//        for item in listItems {
//            item.countOnCart = 0
//        }
    }
}
