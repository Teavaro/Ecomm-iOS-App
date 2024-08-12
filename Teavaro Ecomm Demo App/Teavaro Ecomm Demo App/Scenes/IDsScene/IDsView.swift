//
//  IDsView.swift
//  Ecomm-iOS-App
//
//  Created by bdado on 15/5/23.
//

import SwiftUI
import CoreData
import FunnelConnect
import UTIQ

struct IDsView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section{
                    Text("UserId:")
                        .bold()
                    Text(store.userId ?? "")
                }
                Section{
                    Text("Umid:")
                        .bold()
                    Text(store.umid ?? "")
                }
                Section{
                    Text("Atid:")
                        .bold()
                    Text(store.atid ?? "")
                }
                Section{
                    Text("Mtid:")
                        .bold()
                    Text(store.mtid ?? "")
                }
                Section{
                    Text("Attributes:")
                        .bold()
                    Text(store.attributes ?? "")
                }
            }
        }
        .navigationTitle("IDs")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .white, titleColor: .black)
        .listStyle(.insetGrouped)
        .onAppear(perform: {
            TrackUtils.impression(value: "IDs_view")
        })
    }
}


struct IDsView_Previews: PreviewProvider {
    static var previews: some View {
        IDsView()
    }
}
