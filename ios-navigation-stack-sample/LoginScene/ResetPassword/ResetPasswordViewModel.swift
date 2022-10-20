//
//  ResetPasswordViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class ResetPasswordViewModel: ObservableObject {
    @Published var email: String
    
    init(email: String) {
        self.email = email
    }
    
    func resetPassword() throws {
        guard !email.isEmpty else {
            throw LoginError.emailEmpty
        }
    }
}
