//
//  Login1View.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnect

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
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            insertText(text: "Email address")
            TextField("Email address", text: $loginId)
                .textFieldStyle(.roundedBorder)
                .frame(height: 35)
                .padding(.top, 10)
            insertText(text: "Password")
                .padding(.top, 25)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(height: 35)
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            insertButton(title: "Login", action: {
                if(loginId != "" && password != ""){
                    if(FunnelConnectSDK.shared.isInitialize() && UserDefaultsUtils.isCdpNba()){
                        if let userId = loginId.aes256{
                            FunnelConnectSDK.shared.setUser(fcUser: FCUser(userIdType: "enemail", userId: userId), dataCallback:
                                                                { data in
                                store.processInfoResponse(infoResponse: data)
                                store.umid = try? FunnelConnectSDK.shared.getUMID()
                                store.userId = userId
                                store.isLogin = true
                                UserDefaultsUtils.setLogin(value: true)
                                UserDefaultsUtils.setUserName(value: loginId)
                                UserDefaultsUtils.setUserId(value: userId)
                            }, errorCallback: { _ in
                                
                            })
                            dismiss()
                        }
                    }
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
            TrackUtils.impression(value: "login_view")
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
