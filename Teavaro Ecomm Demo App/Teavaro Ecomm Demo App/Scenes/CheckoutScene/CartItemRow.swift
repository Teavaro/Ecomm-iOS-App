//
//  ItemRow.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct CartItemRow : View {
    
    let item: ShopItem

    var body: some View {
        VStack{
            Text(item.title)
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .trailing)
            HStack {
                VStack(alignment: .leading) {
                    Text("Price:")
                        .bold()
                    Text("Quantity:")
                        .bold()
                    Text("Subtal:")
                        .bold()
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("$\(String(format: "%.2f", item.price)) / piece")
                    Text("\(item.countOnCart)")
                    Text("$\(String(format: "%.2f", item.price * Float(item.countOnCart)))")
                }
            }.padding()
        }
    }
}

//struct CartItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CartItemRow(item: store.listItems.first!)
//    }
//}
