//
//  TopRoundedCornersRectange.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 30/06/2022.
//

import SwiftUI

struct TopRoundedCornersRectange: View {
    
    var radius: CGFloat = 25
    var height: CGFloat = 50
    
    var body: some View {
        Rectangle()
            .frame(height: self.height)
            .foregroundColor(.black)
            .padding(.bottom, radius)
            .cornerRadius(radius)
            .padding(.bottom, -radius)
    }
}

struct TopRoundedCornersRectange_Previews: PreviewProvider {
    static var previews: some View {
        TopRoundedCornersRectange()
    }
}
