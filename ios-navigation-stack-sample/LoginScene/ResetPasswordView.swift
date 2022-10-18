//
//  ResetPasswordView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

class ResetPasswordViewModel: ObservableObject {
    @Published var email: String
    
    init(email: String) {
        self.email = email
    }
}

struct ResetPasswordView: View {
    @StateObject var model: ResetPasswordViewModel
    
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            TextField("Email", text: $model.email)
                .textContentType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                router.loginPath.removeLast()
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 50)
    }
}
