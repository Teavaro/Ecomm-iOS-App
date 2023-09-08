//
//  PermissionsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import funnelConnectSDK
import utiqSDK

struct PermissionsView: View {
    
    @EnvironmentObject var store: Store
    @State private var om: Bool = true
    @State private var opt: Bool = true
    @State private var nba: Bool = true
    @Environment(\.dismiss) private var dismiss
    
    fileprivate func insertButton(title: String, color: Color, action: @escaping() -> Void) -> some View {
        return Button {
            action()
        } label: {
            Text(title)
                .bold()
                .foregroundColor(.white)
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(color)
            .cornerRadius(5)
            .padding(.top, 10)
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
            Text("Analytics Cookies:")
                .foregroundColor(.gray)
            Toggle("Enhance your experience. Our cookies improve our website by analyzing visitor behavior, such as page duration and return frequency.", isOn: $om)
                .font(.system(size: 13))
            Text("Marketing and Social Network:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("Enhance your browsing experience. Our cookies evaluate your behavior and present relevant offers. They also enable valuable insights for advertisers and publishers. We share this information with trusted analytics, marketing, and social media partners. If you're logged in to a social network, your user profile may be enriched with your surfing behavior.", isOn: $opt)
                .font(.system(size: 13))
            Text("Personal Offers:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("Seamless personalization across devices. Our cookie-based identification assigns your profile to all recognized devices, ensuring consistent settings and personalized offers. Your surfing behavior is not utilized for this purpose. Registering for our newsletter allows us to identify you and link it to your profile.", isOn: $nba)
                .font(.system(size: 13))
            HStack{
                insertButton(title: "Reject All", color: .gray, action: {
                    TrackUtils.click(value: "reject_permissions")
                    store.clearData()
                    store.updatePermissions(om: false, nba: false, opt: false)
                    try? UTIQ.shared.rejectConsent()
                    dismiss()
                })
                insertButton(title: "Accept All", color: .green, action: {
                    TrackUtils.click(value: "accept_permissions")
                    store.updatePermissions(om: true, nba: true, opt: true)
                    showUtiqConsent()
                    dismiss()
                })
            }
            insertButton(title: "Save settings", color: Color(UIColor.lightGray), action: {
                TrackUtils.click(value: "save_permissions")
                store.updatePermissions(om: self.om, nba: self.nba, opt: self.opt)
                if(self.om || self.opt || self.nba) {
                    showUtiqConsent()
                }
                else{
                    try? UTIQ.shared.rejectConsent()
                }
                dismiss()
            })
        }
        .padding(30)
        .navigationTitle("CDP and UTIQ Consent")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            if let permissions = try? FunnelConnectSDK.shared.getPermissions(), !permissions.isEmpty(){
                self.om = permissions.getPermission(key: store.keyOm)
                self.opt = permissions.getPermission(key: store.keyOpt)
                self.nba = permissions.getPermission(key: store.keyNba)
            }
            TrackUtils.impression(value: "permissions_view")
        })
    }
    
    func showUtiqConsent(){
//        if(UTIQ.shared.isInitialized()){
            store.showUtiqConsent = true
//        }
    }
}

struct Permissions_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}
