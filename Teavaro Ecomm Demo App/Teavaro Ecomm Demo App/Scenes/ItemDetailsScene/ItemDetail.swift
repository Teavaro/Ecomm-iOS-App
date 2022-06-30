//
//  ItemDetail.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct ItemDetail : View {
    
    @EnvironmentObject var order: Order
    let item: MenuItem

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: UIImage(imageLiteralResourceName: "Image2"))
                .resizable()
                .scaledToFit()
            Text("description jsdgjsdopgjsdpogjsdpogjsdopgjsdpogjsdopgjsdpogjsdpogjsdpogsjpgjsdopgjdspogpsdjgopsdjgpsodgpso")
                .padding(EdgeInsets(top: 25, leading: 10, bottom: 10, trailing: 10))
            
            Button {
                // print("Button tapped!")
                order.add(item: item)
                print("Order Items \(order.items.count)" )
            } label: {
                Text("Order This")
                    .bold()
                    .foregroundColor(.white)
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.cyan)
                .cornerRadius(5)
                .padding()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: items1.first!).environmentObject(Order())
        }
    }
}
