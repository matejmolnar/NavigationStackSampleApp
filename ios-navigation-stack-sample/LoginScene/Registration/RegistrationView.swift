//
//  RegistrationView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var model: RegistrationViewModel
    
    @EnvironmentObject private var router: Router
    @State private var error: Error?
    
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
            
            NavigationLink(value: LoginRoute.forgotPassword(email: model.email)) {
                Text("Forgot password?")
            }
            .padding(.top, 50)
        }
        .padding(.horizontal, 50)
        .navigationTitle("Registration")
        .alert(isPresented: .constant(error != nil)) {
            Alert(
                title: Text("Sign up failed"),
                message: Text(error?.localizedDescription ?? ""),
                dismissButton: .default(Text("OK")) {
                    error = nil
                }
            )
        }
    }
}

extension RegistrationView {
    func signUp() {
        do {
            try model.signUp()
            router.root = .tabBar
        } catch {
            self.error = error
        }
    }
}
