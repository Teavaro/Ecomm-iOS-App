//
//  ItemRow.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 22/06/2022.
//

import SwiftUI

struct ItemRow : View {
    
    let item: MenuItem

    var body: some View {
        HStack {
            Image(uiImage: UIImage(imageLiteralResourceName: "Image"))
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            Spacer()
            VStack(alignment: .leading) {
                Text(item.name)
                Text("Price " + "\(item.price)" + " L.E").padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
        }.padding()
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: items1.first!)
    }
}
