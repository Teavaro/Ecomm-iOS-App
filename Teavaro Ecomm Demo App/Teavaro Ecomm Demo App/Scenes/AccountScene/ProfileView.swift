//
//  ProfileView.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 01/07/2022.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(uiImage: UIImage(imageLiteralResourceName: "logo-angro"))
                .padding()
            //
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .padding(EdgeInsets(top: 100, leading: 25, bottom: 100, trailing: 25))
            //
            VStack {
                //
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 100)
                    .foregroundColor(.blue)
                    .padding(5)
                //
                Text("User Name")
                    .font(.title)
                    .padding(.top, 10)
                //
                Text("Email")
                    .padding(.top, 10)
                //
                Button {
                    print("Button was tapped")
                } label: {
                    Text("Log out")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 100, height: 35)
                }
                .background(.orange)
                .tint(.orange)
                .cornerRadius(5)
                .padding(.top, 25)
            }
            .padding(EdgeInsets(top: 100, leading: 25, bottom: 100, trailing: 25))
        }
        .backgroundBlurEffect()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
