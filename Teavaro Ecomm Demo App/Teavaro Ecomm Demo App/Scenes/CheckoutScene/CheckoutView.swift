//
//  CheckoutView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

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
        // Text(s.$viewModel.ggg)
//        Form {
//            Section {
//                Picker("How do you want to pay?", selection: $paymentType) {
//                    ForEach(paymentTypes, id: \.self) {
//                        Text($0)
//                    }
//                }.pickerStyle(.wheel)
//                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
//                    .padding()
//                if addLoyaltyDetails {
//                    TextField("Enter your iDine ID", text: $loyaltyNumber)
//                        .padding()
//                }
//
//            }
//            Section(header: Text("Add a tip?")) {
//                Picker("Percentage:", selection: $tipAmount) {
//                    ForEach(tipAmounts, id: \.self) {
//                        Text("\($0)%")
//                    }
//                }
//                .pickerStyle(.segmented)
//                .padding()
//            }
//            Section(header: Text("TOTAL: \(totalPrice)").font(.largeTitle)) {
//                Button("Confirm order") {
//                    showingPaymentAlert.toggle()
//                }
//            }
//        }
//        .navigationTitle("Payment")
//        .navigationBarTitleDisplayMode(.inline)
//        .alert(isPresented: $showingPaymentAlert) {
//            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))
//        }
        NavigationView{
            VStack(alignment: .leading) {
                
                List {
                    ForEach(store.listCart) { item in
                        NavigationLink(destination: ItemDetail(item: item, allowAddWish: false, allowAddCart: false)) {
                            CartItemRow(item: item)
                        }
                    }
                    .onDelete{ offsets in
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
                            showingPaymentConfirmationAlert.toggle()
                        })
                    }
                    else{
                        Text("Your cart is currently empty.")
                    }
                }
                .navigationTitle("Checkout")
                .toolbar {
                    EditButton()
                }
                .alert(isPresented: $showingPaymentConfirmationAlert) {
                    Alert(
                        title: Text("Checkout confirmation"),
                        message: Text("Do you want to proceed with checkout?"),
                        primaryButton: .destructive(Text("Proceed"), action: {
                            store.removeAllCartItems()
                        }),
                        secondaryButton: .cancel(Text("Cancel"), action: { // 1

                            
                        })
                    )
                }
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
