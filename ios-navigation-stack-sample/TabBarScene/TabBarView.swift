//
//  TabBarView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        TabView(selection: $router.tabBar.selectedTab) {
            CharactersView(model: .init())
                .tag(Tab.characters)
                .tabItem {
                    Label("Characters", systemImage: "person.2")
                }
            
            EpisodesView(model: .init())
                .tag(Tab.episodes)
                .tabItem {
                    Label("Episodes", systemImage: "film")
                }
        }
        .fullScreenCover(isPresented: $router.tabBar.isSettingsPresented) {
            SettingsView()
        }
    }
}
