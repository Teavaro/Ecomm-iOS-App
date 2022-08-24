//
//  TitleView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 24/8/22.
//

import SwiftUI

struct TitleView: View {
    
    var title: String
    
    var body: some View {
        HStack   {
            Image(uiImage: UIImage(imageLiteralResourceName: "logo"))
                .resizable()
                .frame(minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40, alignment: .center)
            Text(title)
                .font(.title)
                .bold()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Angro")
    }
}



