//
//  WishlistView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI

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
                            store.removeItemFromWish(offsets: offsets)
                        }
                    }
                    else{
                        Text("Your wishlist is currently empty.")
                    }
                }
                 .navigationTitle("Wishlist")
                 .toolbar {
                     EditButton()
                 }
            }
        }
    }
}
    
struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
