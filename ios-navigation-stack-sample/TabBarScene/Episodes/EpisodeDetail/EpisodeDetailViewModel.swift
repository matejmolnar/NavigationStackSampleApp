//
//  EpisodeDetailViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class EpisodeDetailViewModel: ObservableObject {
    @Published var title: String
    
    init(episode: Episode) {
        title = episode.name
    }
}
