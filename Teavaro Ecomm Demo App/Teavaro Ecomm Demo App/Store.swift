//
//  Store.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import Foundation
import SwiftUI

class Store: ObservableObject {
    @Published var listItems: [Item] = []
    @Published var listWish: [Item] = []
    @Published var listCart: [Item] = []
    @Published var listOffer: [Item] = []
    @Published var isLogin = false
    @Published var isCdpStarted = false
    @Published var showModal = false
    let cartId: Int16 = 12
    var infoResponse = """
    {}
    """
    var isFunnelConnectStarted = false
    var isPermissionsValidated = false
    var description = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don’t look even slightly believable. If you are going to use a passage of Lorem Ipsum."

    init() {
        initializeData()
    }

    func addItemToCart(item: Item) {
        DataManager.shared.addItemToCart(itemId: item.id)
        if let index = listCart.firstIndex(where: { $0.id == item.id }) {
            listCart[index].countInCart += 1
        }
        else{
            listCart.append(item)
        }
    }

    func removeItemFromCart(offsets: IndexSet) {
        if let pos = offsets.first{
            let item = listCart[pos]
            DataManager.shared.removeItemFromCart(itemId: Int16(item.id))
        }
        listCart.remove(atOffsets: offsets)
    }

    func addItemToWish(id: Int16) {
        DataManager.shared.addItemToWish(itemId: id)
        listWish.append(listItems[Int(id)])
    }
    
    
    func isItemInWish(item: Item) -> Bool {
        if listWish.firstIndex(of: item) != nil {
            return true
        }
        else{
            return false
        }
    }

    func removeItemFromWish(offsets: IndexSet) {
        if let pos = offsets.first{
            let item = listWish[pos]
            DataManager.shared.removeItemFromWish(itemId: Int16(item.id))
        }
        listWish.remove(atOffsets: offsets)
    }

    func getTotalPriceCart() -> Float {
        var total: Float = 0
        for item in listCart {
            total += item.price * Float(item.countInCart)
        }
        return total
    }

    func removeAllCartItems() {
        DataManager.shared.clearCart()
        listCart.removeAll()
    }
    
    func getBanner() -> String{
        var text = ""
        var obj: InfoResponse? = nil
        do {
            let decoder = JSONDecoder()
            obj = try decoder.decode(InfoResponse.self, from: infoResponse.data(using: .utf8)!)
        } catch {
            print("iran:error:\(error)")
        }
        if obj != nil{
            print("iran:attributes",obj!.attributes)
            for (key, value) in obj!.attributes {
                text += "&amp;" + key + "=" + value
            }
        }
        
        print("iran:infoResponse", infoResponse)
        print("iran:attr", text)
        var htmlContent = """
            <!DOCTYPE html>
               <html>
               <body>
                <div class="celtra-ad-v3">
                    <img src="data:image/png,celtra" style="display: none" onerror="
                        (function(img) {
                            var params = {'clickUrl':'','widthBreakpoint':'','expandDirection':'undefined','preferredClickThroughWindow':'new','clickEvent':'advertiser','externalAdServer':'Custom','tagVersion':'html-standard-7'};
                            var req = document.createElement('script');
                            req.id = params.scriptId = 'celtra-script-' + (window.celtraScriptIndex = (window.celtraScriptIndex||0)+1);
                            params.clientTimestamp = new Date/1000;
                            params.clientTimeZoneOffsetInMinutes = new Date().getTimezoneOffset();
                            params.hostPageLoadId=window.celtraHostPageLoadId=window.celtraHostPageLoadId||(Math.random()+'').slice(2);
                            var qs = '';
                            for (var k in params) {
                                qs += '&amp;' + encodeURIComponent(k) + '=' + encodeURIComponent(params[k]);
                            }
                            var src = 'https://ads.celtra.com/67444e1d/web.js?' + qs + '\(text)';
                            req.src = src;
                            img.parentNode.insertBefore(req, img.nextSibling);
                        })(this);
                    "/>
                </div>
               </body>
               </html>
            """
        return htmlContent
    }
    
    func initializeData(){
//        DataManager.shared.clearData()
        listItems = DataManager.shared.getItems()
        print("\(listItems.count) Items ferched")
        
        if(listItems.isEmpty){
            DataManager.shared.addItem(id: 0, title: "Jacob’s Baked Crinklys Cheese", desc: description,price: 60.00, picture: "crinklys", isOffer: true)
            DataManager.shared.addItem(id: 1, title: "Pork Cocktail Sausages, Pack", desc: description, price: 54.00, picture: "pork", isOffer: true, isInStock: false)
            DataManager.shared.addItem(id: 2, title: "Broccoli and Cauliflower Mix", desc: description, price: 6.00, picture: "cauliflower")
            DataManager.shared.addItem(id: 3, title: "Morrisons Creamed Rice Pudding", desc: description, price: 44.00, picture: "paprika")
            DataManager.shared.addItem(id: 4, title: "Fresh For The Bold Ground Amazon", desc: description, price: 12.00, picture: "burst")
            DataManager.shared.addItem(id: 5, title: "Frito-Lay Doritos & Cheetos Mix", desc: description, price: 20.00, picture: "watermelon")
            DataManager.shared.addItem(id: 6, title: "Green Mountain Coffee Roast", desc: description, price: 20.00, picture: "grapes")
            DataManager.shared.addItem(id: 7, title: "Nature’s Bakery Whole Wheat Bars", desc: description, price: 50.00, picture: "mixed")
            listItems = DataManager.shared.getItems()
        }
        listWish = DataManager.shared.getWishItems()
        listCart = DataManager.shared.getCartItems()
        listOffer = DataManager.shared.getOfferItems()
        print("count abandoned carts: \(DataManager.shared.getAbandonedCarts().count)")
    }
}
