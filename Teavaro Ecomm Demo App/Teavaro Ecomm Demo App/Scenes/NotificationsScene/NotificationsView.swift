//
//  Login1View.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import funnelConnectSDK
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
                        umidAndAction(action: { umid in
                            if let userName = UserDefaultsUtils.getUserId(){
                                PushNotification().sendIdentClick(user: umid, userId: userName, userType: store.userType)
                            }
                        })
                    })
                }
                Section(){
                    Button("Abandoned Cart's campaign", action: {
                        TrackUtils.click(value: "send_ac_notification")
                        umidAndAction(action: { umid in
                            let acId = store.getAbCartId()
                            if acId != -1{
                                PushNotification().sendAbandonedCart(user: umid, abCart: acId)
                            }
                        })
                    })
                }
                Section(){
                    Button("Shop's campaign", action: {
                        TrackUtils.click(value: "send_shop_notification")
                        umidAndAction(action: { umid in
                            PushNotification().sendShop(user: umid)
                        })
                    })
                }
                Section(){
                    Button("Crilklys's campaign", action: {
                        TrackUtils.click(value: "send_crilklys_notification")
                        umidAndAction(action: { umid in
                            PushNotification().sendCrilklys(user: umid)
                        })
                    })
                }
                Section(){
                    Button("Watermelon's campaign", action: {
                        TrackUtils.click(value: "send_watermelon_notification")
                        umidAndAction(action: { umid in
                            PushNotification().sendWatermelon(user: umid)
                        })
                    })
                }
                Section(){
                    Button("Paprika's campaign", action: {
                        TrackUtils.click(value: "send_paprika_notification")
                        umidAndAction(action: { umid in
                            PushNotification().sendPaprika(user: umid)
                        })
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
    
    func umidAndAction(action: @escaping(String) -> Void){
        if let umid = try? FunnelConnectSDK.shared.getUMID(){
            action(umid)
        }
    }
}




struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
