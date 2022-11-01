//
//  NavigationRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 27.10.2022.
//

import Foundation

protocol NavigationRoute: Hashable {
    static func path(from pathComponents: [String], queryDict: [String: String]) -> [Self]?
}
