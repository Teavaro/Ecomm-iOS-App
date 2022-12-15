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
    
    fileprivate func updatePermissions(om: Bool, nba: Bool, opt: Bool) {
        let permissions = PermissionsMap()
        permissions.addPermission(key: "CS-TMI",accepted: om)
        permissions.addPermission(key: "CS-OPT",accepted: opt)
        permissions.addPermission(key: "CS-NBA",accepted: nba)
        try? FunnelConnectSDK.shared.cdp().updatePermissions(permissions: permissions, notificationsName: "APP_CS", notificationsVersion: 4, dataCallback: {_ in
            UserDefaultsUtils.setPermissionsRequested(value: true)
        }, errorCallback: {_ in })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Analytics Tracking:")
                .foregroundColor(.gray)
            Toggle("Used for reporting and optimisation.", isOn: $om)
            Text("Personalisation:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("Used to deliver personalised experiences.", isOn: $opt)
            Text("Network Token:")
                .foregroundColor(.gray)
                .padding(.top, 30)
            Toggle("This enables us to use a mobile network token to collect behavioural data for analytics and personalisation.", isOn: $nba)
            HStack{
                insertButton(title: "Reject All", color: .gray, action: {
                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "rejectPermissions")
                    updatePermissions(om: false, nba: false, opt: false)
                    try? FunnelConnectSDK.shared.trustPid().rejectConsent()
                    dismiss()
                })
                insertButton(title: "Accept All", color: .green, action: {
                    try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "acceptPermissions")
                    updatePermissions(om: true, nba: true, opt: true)
                    startTrustPid()
                    dismiss()
                })
            }
            insertButton(title: "Save settings", color: Color(UIColor.lightGray), action: {
                try? FunnelConnectSDK.shared.cdp().logEvent(key: "Button", value: "savePermissions")
                updatePermissions(om: self.om, nba: self.nba, opt: self.opt)
                if(self.nba) {
                    startTrustPid()
                }
                else{
                    try? FunnelConnectSDK.shared.trustPid().rejectConsent()
                }
                dismiss()
            })
            Spacer()
        }
        .padding(30)
        .navigationTitle("Permissions")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            if let permissions = try? FunnelConnectSDK.shared.cdp().getPermissions(){
                self.om = permissions.getPermission(key: "CS-TMI")
                self.opt = permissions.getPermission(key: "CS-OPT")
                self.nba = permissions.getPermission(key: "CS-NBA")
            }
            try? FunnelConnectSDK.shared.cdp().logEvent(key: "Navigation", value: "permissions")
        })
    }
}

func startTrustPid(){
    try? FunnelConnectSDK.shared.trustPid().acceptConsent()
    let isStub = UserDefaultsUtils.isStub()
    try? FunnelConnectSDK.shared.trustPid().startService(isStub: isStub)
}

struct Permissions_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}
