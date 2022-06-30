//
//  AccountView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 30/06/2022.
//

import SwiftUI

struct AccountView: View {
    
    @State private var loginId: String = ""
    @State private var password: String = ""
    @State private var checked: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(uiImage: UIImage(imageLiteralResourceName: "logo-angro"))
                .padding()
            //
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .padding(EdgeInsets(top: 25, leading: 25, bottom: 20, trailing: 25))
            //
            VStack(alignment: .leading) {
                ZStack {
                    TopRoundedCornersRectange(height: 75)
                        .clipped()
                    //
                    Text("Access Your Account")
                        .font(.title)
                        .frame(height: 50)
                        .foregroundColor(.white)
                }
                //
                Text("Login")
                    .font(.title)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .padding(.leading, 35)
                // Rectangle with gray border
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .fill(.white)
                        .border(.gray, width: 0.5)
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 20, trailing: 25))
                    //
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Username or email address")
                            Text("*")
                                .foregroundColor(.orange)
                        }
                        .padding(.top, 25)
                        TextField("Username or email address", text: $loginId)
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        //
                        HStack {
                            Text("Password")
                            Text("*")
                                .foregroundColor(.orange)
                        }
                        //
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        //
                        Toggle(isOn: $checked) {
                            Text("Remember me")
                        }
                        .toggleStyle(CheckboxStyle())
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        //
                        Button {
                            print("Button was tapped")
                        } label: {
                            Text("Log In")
                                .foregroundColor(.white)
                                .frame(height: 35, alignment: .center)
                        }
                        .frame(width: 100, height: 45)
                        .background(.orange)
                        .tint(.orange)
                        .cornerRadius(5)

                    }
                    .foregroundColor(.gray)
                    .padding(.top, 25)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                }
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
            }
            .padding(EdgeInsets(top: 25, leading: 25, bottom: 20, trailing: 25))
        }
        .backgroundBlurEffect()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
