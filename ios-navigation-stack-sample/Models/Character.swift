//
//  Character.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import Foundation

struct Character: Equatable, Hashable, Identifiable {
    let id: Int
    var name: String {
        "Character \(id)"
    }
}
