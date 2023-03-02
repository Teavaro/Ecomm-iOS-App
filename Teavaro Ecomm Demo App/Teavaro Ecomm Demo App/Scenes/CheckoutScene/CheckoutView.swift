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
                        TrackUtils.click(value: "remove_from_cart")
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
                            TrackUtils.click(value: "proceed_to_checkout")
                            showingPaymentConfirmationAlert.toggle()
                        })
                        .alert(isPresented: $showingPaymentConfirmationAlert) {
                            Alert(
                                title: Text("Checkout confirmation"),
                                message: Text("Do you want to proceed with checkout?"),
                                primaryButton: .destructive(Text("Proceed"), action: {
                                    TrackUtils.click(value: "proceed_to_checkout_confirm")
                                    store.removeAllCartItems()
                                }),
                                secondaryButton: .cancel(Text("Cancel"), action: {
                                    TrackUtils.click(value: "proceed_to_checkout_cancel")
                                })
                            )
                        }
                        insertButton(title: "Clear Cart", action: {
                            TrackUtils.click(value: "clear_cart")
                            showingClearConfirmationAlert.toggle()
                        })
                        .alert(isPresented: $showingClearConfirmationAlert) {
                            Alert(
                                title: Text("Clear confirmation"),
                                message: Text("Do you want to clear the cart?"),
                                primaryButton: .destructive(Text("Yes"), action: {
                                    let idCart = DataManager.shared.addAbandonedCart(items: store.listCart)
                                    let events = [TrackUtils.CLICK: "clear_cart_confirm", TrackUtils.ABANDONED_CART_ID: String(idCart)]
                                    TrackUtils.events(events: events)
                                    store.removeAllCartItems()
                                    UIPasteboard.general.string = "TeavaroEcommDemoApp://showAbandonedCart?id=\(idCart)"
                                }),
                                secondaryButton: .cancel(Text("No"), action: {
                                    TrackUtils.click(value: "clear_cart_cancel")
                                })
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
                TrackUtils.impression(value: "cart_view")
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
