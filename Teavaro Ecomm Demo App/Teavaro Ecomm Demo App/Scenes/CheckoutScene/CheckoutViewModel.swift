//
//  CheckoutViewModel.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 23/06/2022.
//

import SwiftUI

class CheckoutViewModel: BaseViewModel {
    
    @EnvironmentObject var order: Order
    @State var paymentType = "Cash"
    @State var addLoyaltyDetails = false
    @State var loyaltyNumber = ""
    @State var tipAmount = 15
    @State var showingPaymentAlert = false
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
}
