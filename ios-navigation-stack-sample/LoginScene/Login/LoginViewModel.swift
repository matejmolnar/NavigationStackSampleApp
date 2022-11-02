//
//  LoginViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage("userEmail") private var userEmail: String = ""
    
    @Published var email = ""
    @Published var password = ""
    
    func login() throws {
        guard !email.isEmpty else {
            throw LoginError.emailEmpty
        }
        
        guard !password.isEmpty else {
            throw LoginError.passwordEmpty
        }
        
        userEmail = email
    }
}
