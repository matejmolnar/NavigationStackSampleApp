//
//  SettingsRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum SettingsRoute: String, NavigationRoute {
    case profile
    
    static func path(
        from pathComponents: [String],
        queryDict: [String: String]
    ) -> [SettingsRoute]? {
        guard pathComponents.first == "settings" else {
            return nil
        }
        
        var path = [SettingsRoute]()
        var components = pathComponents.dropFirst()
        
        while let first = components.first {
            guard let route = SettingsRoute(rawValue: first) else {
                return nil
            }
            
            path.append(route)
            components = components.dropFirst()
        }
        
        return path
    }
}
