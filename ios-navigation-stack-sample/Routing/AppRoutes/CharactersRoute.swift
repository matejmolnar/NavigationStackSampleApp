//
//  TabRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum CharactersRoute: NavigationRoute {
    case character(id: Int, route: CharacterDetailRoute? = nil)
    
    var authorizationLevel: DeepLinkAuthorizationLevel {
        .loggedIn
    }
    
    static func path(
        from pathComponents: [String],
        queryDict: [String: String]
    ) -> [CharactersRoute]? {
        guard pathComponents.first == "characters" else {
            return nil
        }
        
        var path = [CharactersRoute]()
        var components = pathComponents.dropFirst()
        
        while let domain = components.first {
            components = components.dropFirst()
            
            if let id = Int(components.first ?? "") {
                components = components.dropFirst()
                
                switch domain {
                case "character":
                    // Try to initiate CharacterDetailRoute only for the last path component
                    let route: CharacterDetailRoute? = components.isEmpty ? .init(queryDict: queryDict) : nil
                    path.append(.character(id: id, route: route))
                default:
                    return nil
                }
            }
        }
        
        return path
    }
}
