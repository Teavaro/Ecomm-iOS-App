//
//  AccountView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 30/06/2022.
//

import SwiftUI

struct AccountView: View {
    
    @State private var isLoggedIn: Bool = true

    var body: some View {
        if isLoggedIn {
            ProfileView()
        }
        else {
            LoginView()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
