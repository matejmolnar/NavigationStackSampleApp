//
//  LoginRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum LoginRoute: NavigationRoute {
    case registration(email: String, password: String)
    case forgotPassword(email: String)
    
    static var rootAuthorizationLevel: DeepLinkAuthorizationLevel {
        .onboardingCompleted
    }
    
    var authorizationLevel: DeepLinkAuthorizationLevel {
        .onboardingCompleted
    }
    
    static func path(
        from pathComponents: [String],
        queryDict: [String: String]
    ) -> [LoginRoute]? {
        guard pathComponents.first == "login" else {
            return nil
        }
        
        var path = [LoginRoute]()
        var components = pathComponents.dropFirst()
        
        while let first = components.first {
            components = components.dropFirst()
            
            switch first {
            case "registration":
                path.append(.registration(email: "", password: ""))
            case "forgotpassword":
                path.append(.forgotPassword(email: ""))
            default:
                return nil
            }
        }
        
        return path
    }
}
