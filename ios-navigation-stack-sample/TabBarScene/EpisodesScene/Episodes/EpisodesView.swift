//
//  EpisodesView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var model: EpisodesViewModel
    
    @EnvironmentObject private var router: Router
    
    var body: some View {
        NavigationStack(path: $router.tabBar.episodesPath) {
            List {
                ForEach(model.episodes) { episode in
                    NavigationLink(value: TabRoute.episode(episode)) {
                        Text(episode.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        router.tabBar.isSettingsPresented = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .navigationTitle("Episodes")
            .navigationDestination(for: TabRoute.self) { route in
                switch route {
                case let .character(character, .none):
                    CharacterDetailView(model: .init(character: character))
                case let .character(character, .sheet(sheetModel)):
                    CharacterDetailView(model: .init(character: character, sheetModel: sheetModel))
                case let .episode(episode):
                    EpisodeDetailView(model: .init(episode: episode))
                }
            }
        }
    }
}
