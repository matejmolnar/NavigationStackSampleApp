//
//  LoginRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum LoginRoute: Hashable {
    case registration(email: String, password: String)
    case forgotPassword(email: String)
}
