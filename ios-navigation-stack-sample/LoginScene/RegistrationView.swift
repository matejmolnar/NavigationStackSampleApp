//
//  RegistrationView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @AppStorage("loggedIn") private var loggedIn: Bool = false
    
    @Published var email: String
    @Published var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func signUp() throws {
        loggedIn = true
    }
}

struct RegistrationView: View {
    @StateObject var model: RegistrationViewModel
    
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            TextField("Email", text: $model.email)
                .textContentType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $model.password)
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
            
            Button("Sign up") {
                signUp()
            }
            .padding(.top, 20)
            
            Button("Forgot password?") {
                router.loginPath.append(.forgotPassword(email: model.email))
            }
            .padding(.top, 50)
        }
        .padding(.horizontal, 50)
        .navigationTitle("Registration")
    }
}

extension RegistrationView {
    func signUp() {
        do {
            try model.signUp()
            router.root = .tabBar
        } catch {
            print("login error: \(error)")
        }
    }
}
