//
//  EpisodesViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class EpisodesViewModel: ObservableObject {
    @Published var episodes = Store.episodes
}
