//
//  ItemDetail.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI
import FunnelConnectSDK

struct ItemDetail : View {
    
    @EnvironmentObject var store: Store
    @EnvironmentObject var order: Order
    @Environment(\.dismiss) private var dismiss
    let item: ShopItem
    var allowAddWish: Bool? = true
    var allowAddCart: Bool? = true

    fileprivate func insertButton(title: String, action: @escaping() -> Void) -> some View {
        return Button {
            action()
        } label: {
            Text(title)
                .bold()
                .foregroundColor(.white)
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(.cyan)
            .cornerRadius(5)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: UIImage(imageLiteralResourceName: item.picture))
                .resizable()
                .scaledToFit()
            
            Text(item.description)
                .padding(EdgeInsets(top: 25, leading: 10, bottom: 10, trailing: 10))
            
            if allowAddWish! && !store.isItemInWish(item: item){
                insertButton(title: "Add to Wishlist", action: {
                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "addToWishlist")
                    store.addItemToWish(id: item.id)
                    print("Product added.")
                })
            }
            if allowAddCart! {
                insertButton(title: "Add to Cart", action: {
                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "addToCart")
                    store.addItemToCart(item: item)
                    print("Product added.")
                    dismiss()
                })
            }
            Spacer()
        }
        .padding()
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct ItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ItemDetail(item: store.getItems().first!).environmentObject(Order())
//        }
//    }
//}
