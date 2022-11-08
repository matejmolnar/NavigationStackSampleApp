//
//  DeepLinkAuthorizator.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 02.11.2022.
//

import SwiftUI

struct DeepLinkAuthorizator {
    @AppStorage("userEmail") private var userEmail: String = ""
    @AppStorage("premiumEnabled") private var premiumEnabled: Bool = false
    @AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
    
    private var authorizationLevel: DeepLinkAuthorizationLevel {
        guard onboardingCompleted else {
            return .none
        }
        
        guard !userEmail.isEmpty else {
            return .onboardingCompleted
        }
        
        guard premiumEnabled else {
            return .signedInUser
        }
        
        return .premiumUser
    }
    
    func isRouteDataAuthorized(_ routeData: NavigationRouteData) -> Bool {
        if routeData.type.rootAuthorizationLevel > authorizationLevel {
            return false
        }
        
        for route in routeData.path where route.authorizationLevel > authorizationLevel {
            return false
        }
        
        return true
    }
}
