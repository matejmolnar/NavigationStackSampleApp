//
//  EpisodeDetailViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class EpisodeDetailViewModel: ObservableObject {
    @Published var title: String
    @Published var episodes: [Episode]
    
    init(episodeId: Int) {
        let episode = Store.episodes.first { $0.id == episodeId }
        title = episode?.name ?? ""
        episodes = Store.episodes
    }
}
