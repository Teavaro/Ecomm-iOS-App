//
//  CustomSecureTextField.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 30/06/2022.
//

import SwiftUI

struct CustomSecureTextField: View {
    
    var placeholder: String
    @State var text: String = "Password"
    @State private var showText: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                SecureField(placeholder, text: $text)
                    .opacity(showText ? 0 : 1)
                if showText {
                    HStack {
                        Text(text).lineLimit(1)
                        Spacer()
                    }
                }
            }.padding()
            Button(action: {
                showText.toggle()
            }, label: {
                Image(systemName: showText ? "eye.slash.fill" : "eye.fill")
            })
            .accentColor(.secondary)
            .padding()
        }
        .frame(height: 35)
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(.gray, lineWidth: 0.3)
        .foregroundColor(.clear))
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomSecureTextField(placeholder: "Any placeholder")
                .padding()
                .previewLayout(.fixed(width: 400, height: 100))
            CustomSecureTextField(placeholder: "Any placeholder")
                .padding()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 400, height: 100))
        }
    }
}
