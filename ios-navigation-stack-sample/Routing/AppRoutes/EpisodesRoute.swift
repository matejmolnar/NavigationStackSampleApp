//
//  EpisodesRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 31.10.2022.
//

import Foundation

enum EpisodesRoute: NavigationRoute {
    case episode(id: Int)
    
    var authorizationLevel: DeepLinkAuthorizationLevel {
        .loggedIn
    }
    
    static func path(
        from pathComponents: [String],
        queryDict: [String: String]
    ) -> [EpisodesRoute]? {
        guard pathComponents.first == "episodes" else {
            return nil
        }
        
        var path = [EpisodesRoute]()
        var components = pathComponents.dropFirst()
        
        while let domain = components.first {
            components = components.dropFirst()
            
            if let id = Int(components.first ?? "") {
                switch domain {
                case "episode":
                    path.append(.episode(id: id))
                default:
                    return nil
                }
            }
            
            components = components.dropFirst()
        }
        
        return path
    }
}
