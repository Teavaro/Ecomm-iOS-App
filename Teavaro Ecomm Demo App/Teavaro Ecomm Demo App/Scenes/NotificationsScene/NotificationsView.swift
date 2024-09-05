//
//  Login1View.swift
//  Teavaro Ecomm Demo App
//
//  Created by bdado on 5/8/22.
//

import SwiftUI
import CoreData
import FunnelConnect
import Utiq

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
                    Button("Cashews's campaign", action: {
                        TrackUtils.click(value: "send_cashews_notification")
                        umidAndAction(action: { umid in
                            PushNotification().sendCashews(user: umid)
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
