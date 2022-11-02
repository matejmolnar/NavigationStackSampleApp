//
//  DeepLinkAuthorizationLevel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 02.11.2022.
//

import Foundation

enum DeepLinkAuthorizationLevel: Int {
    case none = 0
    case onboardingCompleted = 1
    case loggedIn = 2
}

extension DeepLinkAuthorizationLevel: Comparable {
    static func < (lhs: DeepLinkAuthorizationLevel, rhs: DeepLinkAuthorizationLevel) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
