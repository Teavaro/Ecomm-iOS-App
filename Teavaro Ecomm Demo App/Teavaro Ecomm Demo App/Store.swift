//
//  Store.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import Foundation
import SwiftUI
import funnelConnectSDK
import utiqSDK
import SwrveSDK
import SwrveGeoSDK

class Store: ObservableObject {
    @Published var listItems: [Item] = []
    @Published var listWish: [Item] = []
    @Published var listCart: [Item] = []
    @Published var listOffer: [Item] = []
    @Published var isLogin = false
    @Published var isCdpStarted = false
    @Published var showModal = false
    @Published var tabSelection: Int = 1
    @Published var itemSelected: Int16? = -1
    @Published var showAbandonedCarts = false
    @Published var abandonedCartId: Int = 0
    @Published var atid: String? = nil
    @Published var mtid: String? = nil
    @Published var umid: String? = nil
    @Published var userId: String? = nil
    @Published var isStub: Bool = false
    let userType = "enemail"

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
        print("getBanner()")
        var text = ""
        var obj: InfoResponse? = nil
        do {
            let decoder = JSONDecoder()
            if let info = infoResponse.data(using: .utf8){
                obj = try decoder.decode(InfoResponse.self, from: info)
            }
        } catch {
            print("readingAttrFromInfoResponse:error:\(error)")
        }
        if obj != nil{
//            print("iran:attributes",obj!.attributes)
            for (key, value) in obj!.attributes {
                text += "&amp;" + key + "=" + value
            }
        }
        if let ab_cart_id = DataManager.shared.getAbandonedCarts().last?.id{
            text += "&amp;" + "ab_cart_id" + "=\(ab_cart_id)"
        }
       
        if let userId = UserDefaultsUtils.getUserId(){
//            text += "&amp;" + "rp.user.userId" + "=\(userName)"
            text += "&amp;" + "rp.user.userId" + "=\(userId)"
            text += "&amp;" + "userType" + "=\(userType)"
        }
        
        text += "&amp;device=ios"
        text += "&amp;impression=offer"
//        print("iran:infoResponse", infoResponse)
        print("iran:attr", text)
//        https://funnelconnect.brand-demo.com/op/brand-demo-web-celtra/ad
        let htmlContent = """
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
                                var src = 'https://funnelconnect.brand-demo.com/op/brand-demo-app-celtra/ad?' + qs + '\(text)';
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
    
    func clearData(){
        isFunnelConnectStarted = false
        isLogin = false
        isStub = false
        umid = ""
        atid = ""
        mtid = ""
        userId = ""
        infoResponse = ""
        abandonedCartId = 0
        DataManager.shared.clearCart()
        DataManager.shared.clearData()
        DataManager.shared.clearAbandonedCarts()
        UserDefaultsUtils.clear()
        try? UTIQ.shared.clearData()
        try? UTIQ.shared.clearCookies()
        try? FunnelConnectSDK.shared.clearData()
        try? FunnelConnectSDK.shared.clearCookies()
        initializeData()
    }
    
    func initializeData(){
//        DataManager.shared.clearData()
//        DataManager.shared.clearAbandonedCarts()
        listItems = DataManager.shared.getItems()
//        print("\(listItems.count) Items ferched")
        
        if(listItems.isEmpty){
            DataManager.shared.addItem(id: 0, title: "Jacob’s Baked Crinklys Cheese & Onion", desc: description,price: 1.99, picture: "crinklys", isOffer: true)
            DataManager.shared.addItem(id: 1, title: "Pork Cocktail Sausages, Pack", desc: description, price: 3.29, picture: "pork", isOffer: true, isInStock: false)
            DataManager.shared.addItem(id: 2, title: "Broccoli and Cauliflower Mix", desc: description, price: 1.99, picture: "cauliflower")
            DataManager.shared.addItem(id: 3, title: "Morrisons Smoked Paprika", desc: description, price: 4.60, picture: "paprika")
            DataManager.shared.addItem(id: 4, title: "Jaffa Tropical Flavour Burst Seedless", desc: description, price: 2.50, picture: "burst")
            DataManager.shared.addItem(id: 5, title: "Pams Chopped Watermelon", desc: description, price: 3.99, picture: "watermelon")
            DataManager.shared.addItem(id: 6, title: "Woolworths Food Flavourburst Seedless Grapes", desc: description, price: 2.00, picture: "grapes")
            DataManager.shared.addItem(id: 7, title: "Ocado Mixed Seedless Grapes", desc: description, price: 2.00, picture: "mixed")
            DataManager.shared.addItem(id: 8, title: "Whole Foods Market, Organic Coleslaw Mix", desc: description, price: 5.49, picture: "coleslaw")
            DataManager.shared.addItem(id: 9, title: "TSARINE Caviar 50g", desc: description, price: 45.50, picture: "tsarine")
            DataManager.shared.addItem(id: 10, title: "Knorr Tomato al Gusto All’ Arrabbiata Soße 370g", desc: description, price: 3.99, picture: "tomato")
            listItems = DataManager.shared.getItems()
        }
        listWish = DataManager.shared.getWishItems()
        listCart = DataManager.shared.getCartItems()
        listOffer = DataManager.shared.getOfferItems()
        isStub = UserDefaultsUtils.getStubToken() != ""
        isLogin = UserDefaultsUtils.isLogin()
        userId = UserDefaultsUtils.getUserId()
    }
    
    func processCelraAction(celtraResponse: String){
        let decoder = JSONDecoder()
        var itemView = false, abCartView = false, shopView = false, goToWeb = false
        var url = ""
        var obj: CeltraResponse? = nil
        do {
            if let celtraData = celtraResponse.data(using: .utf8){
                obj = try decoder.decode(CeltraResponse.self, from: celtraData)
            }
        } catch {
            print("readingAttrFromCeltraResponse:error:\(error)")
        }
        if obj != nil{
            for (key, value) in obj!.attributes {
                if(key == "impression"){
                    if(value == "ItemView"){
                        itemView = true
                    }
                    else if(value == "ShopView"){
                        shopView = true
                    }
                    else if(value == "AbCartView"){
                        abCartView = true
                    }
                    else if(value == "WebIdent"){
                        goToWeb = true
                    }
                }
                if(key == "item_id"){
                    itemSelected = Int16(value) ?? -1
                }
                if(key == "ab_cart_id"){
                    abandonedCartId = Int(value) ?? getAbCartId()
                }
                if(key == "ident_url"){
                    url = value
                }
            }
            if(abCartView && abandonedCartId != 0){
                showAbandonedCarts = true
            }
            else{
                shopView = true
            }
            if(itemView || shopView){
                tabSelection = 2
            }
            if(goToWeb && url != ""){
                if let webUrl = URL(string: url), UIApplication.shared.canOpenURL(webUrl) {
                   if #available(iOS 10.0, *) {
                      UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
                   } else {
                      UIApplication.shared.openURL(webUrl)
                   }
                }
            }
        }
    }
    
    func getAbCartId() -> Int{
        if let last = DataManager.shared.getAbandonedCarts().last{
            return last.id
        }
        return -1
    }
    
    func handleDeepLink(components: URLComponents){
        if let parameter = components.queryItems?.first{
//            print("iraniran:itemdescription", parameter.name + ", \(parameter.value)")
            if(components.host == "showAbandonedCart" && parameter.name == "ab_cart_id" && parameter.value != nil){
                abandonedCartId = Int(parameter.value!) ?? getAbCartId()
                showAbandonedCarts = true
            }
            if(components.host == "showSection" && parameter.name == "impression" && parameter.value == "ShopView"){
                tabSelection = 2
            }
            if(components.host == "itemdescription" && parameter.name == "item_id" && parameter.value != nil){
                itemSelected = Int16(parameter.value ?? "-1")!
                tabSelection = 2
            }
        }
    }
    
    func getClickIdentLink() -> String?{
        if let userName = UserDefaultsUtils.getUserId(){
            return "https://funnelconnect.brand-demo.com/op/brand-demo-app-click-ident/click?\(userType)=\(userName)&uri=https%3A%2F%2Fweb.brand-demo.com%2F"
        }
        return nil
    }
    
    func getAbCartLink() -> String?{
        if let abCartId = DataManager.shared.getAbandonedCarts().last?.id{
            return "TeavaroEcommDemoApp://showAbandonedCart?ab_cart_id=\(abCartId)"
        }
        return nil
    }
    
    func utiqStartService(){
        if let isConsentAccepted = try? UTIQ.shared.isConsentAccepted(){
            if(isConsentAccepted){
                let stubToken = UserDefaultsUtils.getStubToken()
                UTIQ.shared.startService(stubToken: stubToken, dataCallback: {data in
                    self.mtid = data.mtid
                    TrackUtils.mtid = data.mtid
                    self.atid = data.atid
                },errorCallback: {error in
                    print("error UTIQ.shared.startService")
                    print("error: \(error)")
                })
            }
        }
    }
    
    func fcStartService(action: @escaping() -> Void){
        FunnelConnectSDK.shared.startService(notificationsName: "MAIN_CS", notificationsVersion: 1, dataCallback: { data in
            if let umid = try? FunnelConnectSDK.shared.getUMID() {
                self.isCdpStarted.toggle()
                self.umid = umid
                self.infoResponse = data
                print("excecuting SwrveSDK.start(withUserId: \(umid))")
                SwrveSDK.start(withUserId: umid)
                print("excecuting SwrveGeoSDK.start()")
                SwrveGeoSDK.start()
                self.isFunnelConnectStarted = true
                action()
            }
        }, errorCallback: {error in
            print("error FunnelConnectSDK.cdp.startService()")
            print("error: \(error)")
        })
    }
}
