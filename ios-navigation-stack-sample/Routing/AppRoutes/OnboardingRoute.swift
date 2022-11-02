//
//  OnboardingRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum OnboardingRoute: String, NavigationRoute {
    case step1
    case step2
    
    var authorizationLevel: DeepLinkAuthorizationLevel {
        .none
    }
    
    static func path(
        from pathComponents: [String],
        queryDict: [String: String]
    ) -> [OnboardingRoute]? {
        guard pathComponents.first == "onboarding" else {
            return nil
        }
        
        var path = [OnboardingRoute]()
        var components = pathComponents.dropFirst()
        
        while let first = components.first {
            guard let route = OnboardingRoute(rawValue: first) else {
                return nil
            }
            
            path.append(route)
            components = components.dropFirst()
        }
        
        return path
    }
}
