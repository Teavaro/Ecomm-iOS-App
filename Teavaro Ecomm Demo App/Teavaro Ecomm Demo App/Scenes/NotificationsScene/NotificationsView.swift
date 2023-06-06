//
//  Login1View.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
//import FunnelConnectSDK
import utiqSDK

struct NotificationsView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section(){
                    Button("Ident Click's campaign", action: {
                        TrackUtils.click(value: "send_ident_click_notification")
//                        if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
//                            if let userId = try? FunnelConnectSDK.shared.cdp().getUserId(){
//                                PushNotification().sendIdentClick(user: umid, userId: userId)
//                            }
//                        }
                    })
                }
                Section(){
                    Button("Abandoned Cart's campaign", action: {
                        TrackUtils.click(value: "send_ac_notification")
//                        if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
//                            let acId = store.getAbCartId()
//                            if acId != -1{
//                                PushNotification().sendAbandonedCart(user: umid, abCart: acId)
//                            }
//                        }
                    })
                }
                Section(){
                    Button("Shop's campaign", action: {
                        TrackUtils.click(value: "send_shop_notification")
//                        if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
//                            PushNotification().sendShop(user: umid)
//                        }
                    })
                }
                Section(){
                    Button("Crilklys's campaign", action: {
                        TrackUtils.click(value: "send_crilklys_notification")
//                        if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
//                            PushNotification().sendCrilklys(user: umid)
//                        }
                    })
                }
                Section(){
                    Button("Watermelon's campaign", action: {
                        TrackUtils.click(value: "send_watermelon_notification")
//                        if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
//                            PushNotification().sendWatermelon(user: umid)
//                        }
                    })
                }
                Section(){
                    Button("Paprika's campaign", action: {
                        TrackUtils.click(value: "send_paprika_notification")
//                        if let umid = try? FunnelConnectSDK.shared.cdp().getUmid(){
//                            PushNotification().sendPaprika(user: umid)
//                        }
                    })
                }
            }
        }
        .navigationTitle("Send Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .white, titleColor: .black)
        .listStyle(.insetGrouped)
        .onAppear(perform: {
            TrackUtils.impression(value: "send_notifications_view")
        })
    }
}


struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
