//
//  ItemRow.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct ItemRow : View {
    
    let item: Item

    var body: some View {
        HStack {
            Image(uiImage: UIImage(imageLiteralResourceName: item.picture ?? ""))
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(item.title ?? "")
                    .bold()
                Text("Price " + "$\(item.price)").padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
        }.padding()
    }
}

//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRow(item: store.listItems.first!)
//    }
//}
