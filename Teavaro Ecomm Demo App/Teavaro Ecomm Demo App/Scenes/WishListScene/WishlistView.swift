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
                            TrackUtils.click(value: "remove_item_from_wishlist")
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
                TrackUtils.impression(value: "wishlist_view")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
    
struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
