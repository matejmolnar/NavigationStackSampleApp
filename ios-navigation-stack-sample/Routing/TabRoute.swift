//
//  TabRoute.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import Foundation

enum TabRoute: Hashable {
    case character(character: Character, route: CharacterRoute? = nil)
    case episode(Episode)
}
