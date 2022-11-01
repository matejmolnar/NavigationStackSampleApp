//
//  Episode.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import Foundation

struct Episode: Equatable, Hashable, Identifiable {
    let id: Int
    var name: String {
        "Episode \(id)"
    }
}
