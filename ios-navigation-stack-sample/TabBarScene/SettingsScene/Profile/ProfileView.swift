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
            Button {
                model.tapLogout()
                router.root = .login
            } label: {
                Text("Logout")
                    .foregroundColor(.pink)
            }
        }
    }
}
