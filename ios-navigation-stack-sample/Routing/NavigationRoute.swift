//
//  NavigationRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 27.10.2022.
//

import Foundation

protocol NavigationRoute: Hashable {
    static func path(from pathComponents: [String], queryDict: [String: String]) -> [Self]?
    
    // The rootAuthorizationLevel is needed mainly in case we want to deep link into a
    // root view of some scene, hence the navigation path array remains empty
    // and we would have no way to authorise the deep link.
    static var rootAuthorizationLevel: DeepLinkAuthorizationLevel { get }
    
    // On top of the rootAuthorizationLevel each route component in the navigation path
    // array can have a different authorizationLevel
    var authorizationLevel: DeepLinkAuthorizationLevel { get }
}
