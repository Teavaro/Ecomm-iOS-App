//
//  CheckoutView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI
import FunnelConnectSDK

let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
let tipAmounts = [10, 15, 20, 25, 0]

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var store: Store
    @State var paymentType = "Cash"
    @State var addLoyaltyDetails = false
    @State var loyaltyNumber = ""
    @State var tipAmount = 15
    @State var showingPaymentConfirmationAlert = false
    @State var showingClearConfirmationAlert = false
    @State var showingPaymentAlert = false
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
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
        NavigationView{
            VStack(alignment: .leading) {
                List {
                    ForEach(store.listCart) { item in
                        NavigationLink(destination: ItemDetail(item: item, allowAddWish: false, allowAddCart: false)) {
                            CartItemRow(item: item)
                        }
                    }
                    .onDelete{ offsets in
                        try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "removeFromCart")
                        store.removeItemFromCart(offsets: offsets)
                    }
                    if store.listCart.count > 0 {
                        HStack{
                            Text("Total:")
                                .bold()
                            Text("$\(String(format: "%.2f", store.getTotalPriceCart())) in total")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        insertButton(title: "Proceed to checkout", action: {
                            try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "proceedToCheckout")
                            showingPaymentConfirmationAlert.toggle()
                        })
                        .alert(isPresented: $showingPaymentConfirmationAlert) {
                            Alert(
                                title: Text("Checkout confirmation"),
                                message: Text("Do you want to proceed with checkout?"),
                                primaryButton: .destructive(Text("Proceed"), action: {
                                    store.removeAllCartItems()
                                }),
                                secondaryButton: .cancel(Text("Cancel"))
                            )
                        }
                        insertButton(title: "Clear Cart", action: {
                            try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "clearCart")
                            showingClearConfirmationAlert.toggle()
                        })
                        .alert(isPresented: $showingClearConfirmationAlert) {
                            Alert(
                                title: Text("Clear confirmation"),
                                message: Text("Do you want to clear the cart?"),
                                primaryButton: .destructive(Text("Yes"), action: {
                                    let idCart = DataManager.shared.addAbandonedCart(items: store.listCart)
                                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "clearCart")
                                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "shopping_cart_id", value: String(idCart))
                                    store.removeAllCartItems()
                                    UIPasteboard.general.string = "TeavaroEcommDemoApp://showAbandonedCart?id=\(idCart)"
                                }),
                                secondaryButton: .cancel(Text("No"))
                            )
                        }
                    }
                    else{
                        Text("Your cart is currently empty.")
                    }
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(leading: TitleView(title: "Cart"))
                .navigationBarColor(backgroundColor: .white, titleColor: .black)
                .toolbar {
                    EditButton()
                }
            }
            .onAppear(perform: {
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "cart")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
