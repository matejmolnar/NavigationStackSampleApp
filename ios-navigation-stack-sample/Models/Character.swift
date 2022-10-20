//
//  Character.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import Foundation

struct Character: Equatable, Hashable, Identifiable {
    let id: UUID = .init()
    let name: String
}
