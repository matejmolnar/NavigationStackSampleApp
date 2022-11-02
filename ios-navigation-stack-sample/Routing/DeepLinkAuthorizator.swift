//
//  DeepLinkAuthorizator.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 02.11.2022.
//

import SwiftUI

struct DeepLinkAuthorizator {
    @AppStorage("userEmail") private var userEmail: String = ""
    @AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
    
    private var authorizationLevel: DeepLinkAuthorizationLevel {
        if !userEmail.isEmpty {
            return .loggedIn
        }
        
        if onboardingCompleted {
            return .onboardingCompleted
        }
        
        return .none
    }
    
    func isPathAuthorized(_ path: [any NavigationRoute]) -> Bool {
        for route in path where route.authorizationLevel > authorizationLevel {
            return false
        }
        
        return true
    }
}
