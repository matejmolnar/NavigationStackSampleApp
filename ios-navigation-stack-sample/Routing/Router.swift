//
//  Router.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

// This object holds navigation state of the whole App
class Router: ObservableObject {
    @Published var onboardingPath: [OnboardingRoute]
    @Published var loginPath: [LoginRoute]
    @Published var tabBar: TabBar
    @Published var root: NavigationRoot {
        willSet {
            switch newValue {
            case .login: loginPath = []
            case .onboarding: onboardingPath = []
            case .tabBar: tabBar = .init()
            }
        }
    }
    
    init(
        root: NavigationRoot,
        loginPath: [LoginRoute] = [],
        onboardingPath: [OnboardingRoute] = [],
        tabBar: TabBar = .init()
    ) {
        self.root = root
        self.loginPath = loginPath
        self.onboardingPath = onboardingPath
        self.tabBar = tabBar
    }
}

extension Router {
    struct TabBar {
        var selectedTab: Int
        var isSettingsPresented: Bool
        var charactersPath: [TabRoute]
        var episodesPath: [TabRoute]
        var settingsPath: [SettingsRoute]
        
        init(
            selectedTab: Int = 0,
            isSettingsPresented: Bool = false,
            charactersPath: [TabRoute] = [],
            episodesPath: [TabRoute] = [],
            settingsPath: [SettingsRoute] = []
        ) {
            self.selectedTab = selectedTab
            self.isSettingsPresented = isSettingsPresented
            self.charactersPath = charactersPath
            self.episodesPath = episodesPath
            self.settingsPath = settingsPath
        }
    }
}
