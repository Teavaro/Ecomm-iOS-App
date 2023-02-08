//
//  WishlistView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import FunnelConnectSDK

struct WishlistView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    if store.listWish.count > 0 {
                        ForEach(store.listWish) { item in
                            NavigationLink(destination: ItemDetail(item: item, allowAddWish: false)) {
                                ItemRow(item: item)
                            }
                        }
                        .onDelete{ offsets in
                            try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "removeFromWishlist")
                            store.removeItemFromWish(offsets: offsets)
                        }
                    }
                    else{
                        Text("Your wishlist is currently empty.")
                    }
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Wishlist"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
                 .toolbar {
                     EditButton()
                 }
            }
            .onAppear(perform: {
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "wishlist")
            })
        }
    }
}
    
struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
