//
//  RegistrationViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
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
        guard !email.isEmpty else {
            throw LoginError.emailEmpty
        }
        
        guard !password.isEmpty else {
            throw LoginError.passwordEmpty
        }
        
        loggedIn = true
    }
}
