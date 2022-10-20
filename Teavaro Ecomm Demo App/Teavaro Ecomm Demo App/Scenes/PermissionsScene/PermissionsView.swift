//
//  PermissionsView.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnectSDK

struct PermissionsView: View {
    
    @EnvironmentObject var store: Store
    @State private var om: Bool = false
    @State private var nba: Bool = false
    @State private var opt: Bool = false
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
            .padding(.top, 30)
    }
    
    fileprivate func insertText(text: String) -> some View  {
        return HStack {
            Text(text)
            Text("*")
                .foregroundColor(.orange)
        }
        .padding(.top, 25)
    }
    
    fileprivate func updatePermissions(om: Bool, nba: Bool, opt: Bool) {
        let permissions = PermissionsMap()
        UserDefaultsUtils.setCdpOm(om: om)
        UserDefaultsUtils.setCdpNba(nba: nba)
        UserDefaultsUtils.setCdpOpt(opt: opt)
        try? FunnelConnectSDK.shared.cdp().updatePermissions(permissions: permissions, notificationsVersion: -1, dataCallback: {_ in }, errorCallback: {_ in })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Performance Cookies:")
                .foregroundColor(.gray)
            Toggle("These cookies allow us to count visits and traffic sources so we can measure and improve the performance of our site.", isOn: $om)
            Text("Targeting Cookies:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("These cookies may be set through our site by our advertising partners. They may be used by those companies to build a profile of your interests and show you relevant adverts on other sites.", isOn: $opt)
            Text("Network-based Marketing(TrustPid):")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("Used to provide personalised online marketing based on a unique network token. Trustpid creates and manages the marketing token in a way that does not directly identify you to this website.", isOn: $nba)
            HStack{
                insertButton(title: "Reject All", color: .gray, action: {
                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "rejectPermissions")
                    updatePermissions(om: false, nba: false, opt: false)
                    try? FunnelConnectSDK.shared.trustPid().rejectConsent()
                    dismiss()
                })
                insertButton(title: "Accept", color: .cyan, action: {
                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "acceptPermissions")
                    updatePermissions(om: self.om, nba: self.nba, opt: self.opt)
                    if(self.nba) {
                        try? FunnelConnectSDK.shared.trustPid().acceptConsent()
                        try? FunnelConnectSDK.shared.trustPid().startService()
                    }
                    else{
                        try? FunnelConnectSDK.shared.trustPid().rejectConsent()
                        UserDefaultsUtils.setCdpOm(om: false)
                        UserDefaultsUtils.setCdpNba(nba: false)
                        UserDefaultsUtils.setCdpOpt(opt: false)
                    }
                    dismiss()
                })
            }
            Spacer()
        }
        .padding(30)
        .navigationTitle("Permissions")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            self.om = UserDefaultsUtils.isCdpOm()
            self.opt = UserDefaultsUtils.isCdpOpt()
            self.nba = UserDefaultsUtils.isCdpNba()
            try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "permissions")
        })
    }
}

struct Permissions_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}
