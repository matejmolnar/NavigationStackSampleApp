//
//  LoginView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct LoginView: View {
    @StateObject var model: LoginViewModel
    
    @EnvironmentObject private var router: Router
    @State private var error: Error?
    
    var body: some View {
        NavigationStack(path: $router.loginPath) {
            rootView
            .navigationDestination(for: LoginRoute.self) { route in
                switch route {
                case let .registration(email, password):
                    RegistrationView(model: .init(email: email, password: password))
                case let .forgotPassword(email):
                    ResetPasswordView(model: .init(email: email))
                }
            }
        }
    }
}

extension LoginView {
    var rootView: some View {
        VStack {
            TextField("Email", text: $model.email)
                .textContentType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $model.password)
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
            
            Button("Login") {
                login()
            }
            .padding(.top, 20)
            
            NavigationLink(value: LoginRoute.registration(email: model.email, password: model.password)) {
                Text("Sign up")
            }
            .padding(.top, 50)
            
            NavigationLink(value: LoginRoute.forgotPassword(email: model.email)) {
                Text("Forgot password?")
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 50)
        .navigationTitle("Login")
        .alert(isPresented: .constant(error != nil)) {
            Alert(
                title: Text("Login failed"),
                message: Text(error?.localizedDescription ?? ""),
                dismissButton: .default(Text("OK")) {
                    error = nil
                }
            )
        }
    }
}

extension LoginView {
    func login() {
        do {
            try model.login()
            router.root = .tabBar
        } catch {
            self.error = error
        }
    }
}
