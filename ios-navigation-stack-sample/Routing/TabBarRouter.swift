//
//  TabBarRouter.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 01.11.2022.
//

import Foundation

struct TabBarRouter {
    var selectedTab: Tab
    var isSettingsPresented: Bool
    var charactersPath: [CharactersRoute]
    var episodesPath: [EpisodesRoute]
    var settingsPath: [SettingsRoute]
    
    init(
        selectedTab: Tab = .characters,
        isSettingsPresented: Bool = false,
        charactersPath: [CharactersRoute] = [],
        episodesPath: [EpisodesRoute] = [],
        settingsPath: [SettingsRoute] = []
    ) {
        self.selectedTab = selectedTab
        self.isSettingsPresented = isSettingsPresented
        self.charactersPath = charactersPath
        self.episodesPath = episodesPath
        self.settingsPath = settingsPath
    }
}
