//
//  ProfileView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var model: ProfileViewModel
    
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Email")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text(model.userEmail)
                        .font(.title3)
                }
                
                HStack {
                    Text("Premium")
                        .font(.title3)
                    
                    Spacer()
                    
                    Toggle(isOn: model.$premiumEnabled) {
                        
                    }
                }
            }
            .padding(.bottom, 50)
            .padding(.horizontal, 50)
            
            Button {
                model.logout()
                router.root = .login
            } label: {
                Text("Logout")
                    .foregroundColor(.pink)
            }
        }
        .navigationTitle("Profile")
    }
}
