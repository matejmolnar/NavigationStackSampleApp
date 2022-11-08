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
    case signedInUser = 2
    case premiumUser = 3
}

extension DeepLinkAuthorizationLevel: Comparable {
    static func < (lhs: DeepLinkAuthorizationLevel, rhs: DeepLinkAuthorizationLevel) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
