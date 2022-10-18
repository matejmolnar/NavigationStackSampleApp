//
//  LoginView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage("loggedIn") private var loggedIn: Bool = false
    
    @Published var email = ""
    @Published var password = ""
    
    func login() throws {
        guard !email.isEmpty else {
            throw LoginError.emailEmpty
        }
        
        guard !password.isEmpty else {
            throw LoginError.passwordEmpty
        }
        
        loggedIn = true
    }
}

struct LoginView: View {
    @StateObject var model: LoginViewModel
    @EnvironmentObject private var router: Router
    @State var error: Error?
    
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
            
            Button("Register") {
                router.loginPath.append(.registration(email: model.email, password: model.password))
            }
            .padding(.top, 50)
            
            Button("Forgot password?") {
                router.loginPath.append(.forgotPassword(email: model.email))
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 50)
        .navigationTitle("Login")
        .alert(isPresented: .constant(error != nil)) {
            Alert(
                title: Text("Login error"),
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
