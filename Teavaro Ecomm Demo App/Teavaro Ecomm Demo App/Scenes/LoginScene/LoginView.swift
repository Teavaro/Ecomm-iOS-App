//
//  Login1View.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct LoginView: View {
    
    @EnvironmentObject var store: Store
    @State private var loginId: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) private var dismiss
    @State var showingEmptyFieldsAlert: Bool = false
    
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
    
    fileprivate func insertText(text: String) -> some View  {
        return HStack {
            Text(text)
            Text("*")
                .foregroundColor(.orange)
        }
        .padding(.top, 25)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            insertText(text: "Email address")
            TextField("Email address", text: $loginId)
                .textFieldStyle(.roundedBorder)
                .frame(height: 35)
                .padding(.top, 10)
            insertText(text: "Password")
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(height: 35)
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            insertButton(title: "Login", action: {
                if(loginId != "" && password != ""){
                    store.isLogin = true
                    try? FunnelConnectSDK.shared.cdp().setUser(fcUser: FCUser(userIdType: "slsc", userId: loginId.hash256))
                    dismiss()
                }
                else{
                    self.showingEmptyFieldsAlert.toggle()
                }
            })
            Spacer()
        }
        .padding(30)
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Need to insert email and password!", isPresented: $showingEmptyFieldsAlert) {
                    Button("Ok", role: .cancel) { }
        }
        .onAppear(perform: {
            try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "login")
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
