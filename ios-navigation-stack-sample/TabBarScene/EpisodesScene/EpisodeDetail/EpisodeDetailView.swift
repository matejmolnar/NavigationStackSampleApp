//
//  EpisodeDetailView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    @StateObject var model: EpisodeDetailViewModel
    
    var body: some View {
        List {
            ForEach(model.episodes) { episode in
                NavigationLink(value: EpisodesRoute.episode(id: episode.id)) {
                    Text(episode.name)
                }
            }
        }
        .navigationTitle(model.title)
    }
}
