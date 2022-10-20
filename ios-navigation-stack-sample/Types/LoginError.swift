//
//  LoginError.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum LoginError: LocalizedError {
    case emailEmpty
    case passwordEmpty
    
    var errorDescription: String? {
        switch self {
        case .emailEmpty: return "Email cannot be empty"
        case .passwordEmpty: return "Password cannot be empty"
        }
    }
}
