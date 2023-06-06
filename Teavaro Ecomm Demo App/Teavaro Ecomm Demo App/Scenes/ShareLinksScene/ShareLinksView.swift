//
//  ShareLinks.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 15/5/23.
//

import SwiftUI
import CoreData
//import FunnelConnectSDK
import utiqSDK

struct ShareLinksView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section(){
                    Button("Click Idend link", action: {
                        TrackUtils.click(value: "share_ident_click_link")
//                        if let userId = try? FunnelConnectSDK.shared.cdp().getUserId(){
//                            let link = "https://funnelconnect.brand-demo.com/op/brand-demo-app-click-ident/click?hemail=\(userId)&uri=https%3A%2F%2Fweb.brand-demo.com%2F"
//                            openShareDialog(subject: "Click Idend link", link: link)
//                        }
                    })
                }
                Section(){
                    Button("Abandoned Cart link", action: {
                        TrackUtils.click(value: "share_ac_link")
                        let link = "TeavaroEcommDemoApp://showAbandonedCart?ab_cart_id=\(store.getAbCartId())"
                        openShareDialog(subject: "Abandoned Cart link", link: link)
                    })
                }
            }
        }
        .navigationTitle("Share Links")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .white, titleColor: .black)
        .listStyle(.insetGrouped)
        .onAppear(perform: {
            TrackUtils.impression(value: "share_links_view")
        })
    }
    
    func openShareDialog(subject: String, link: String){
        let mailTo = ""
        if let urlString = "mailto:\(mailTo)?subject=\(subject)&body=\(link)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            UIApplication.shared.open(url, completionHandler: nil)
        }
        else {
            print("Error")
        }
    }
}


struct ShareLinksView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinksView()
    }
}
