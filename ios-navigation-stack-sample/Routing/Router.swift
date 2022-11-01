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
    @Published var tabBar: TabBarRouter
    @Published var root: NavigationRoot {
        willSet {
            switch newValue {
            case .login: loginPath = []
            case .onboarding: onboardingPath = []
            case .tabBar: tabBar = .init()
            }
        }
    }
    
    private let routeTypes: [any NavigationRoute.Type] = [
        OnboardingRoute.self,
        LoginRoute.self,
        SettingsRoute.self,
        EpisodesRoute.self,
        CharactersRoute.self
    ]
    
    init(
        root: NavigationRoot,
        loginPath: [LoginRoute] = [],
        onboardingPath: [OnboardingRoute] = [],
        tabBar: TabBarRouter = .init()
    ) {
        self.root = root
        self.loginPath = loginPath
        self.onboardingPath = onboardingPath
        self.tabBar = tabBar
    }
}

// MARK: - Public functions
extension Router {
    func executeDeepLink(url: URL) throws {
        guard let path = path(from: url) else {
            throw DeepLinkError.invalidURL
        }
        
        switch path {
        case let (path as [OnboardingRoute]) as Any:
            root = .onboarding
            onboardingPath = path
        case let (path as [LoginRoute]) as Any:
            root = .login
            loginPath = path
        case let (path as [SettingsRoute]) as Any:
            root = .tabBar
            tabBar.isSettingsPresented = true
            tabBar.settingsPath = path
        case let (path as [EpisodesRoute]) as Any:
            root = .tabBar
            tabBar.selectedTab = .episodes
            tabBar.episodesPath = path
        case let (path as [CharactersRoute]) as Any:
            root = .tabBar
            tabBar.selectedTab = .characters
            tabBar.charactersPath = path
        default: break
        }
    }
}

// MARK: - Private functions
private extension Router {
    func path(from url: URL) -> ([any NavigationRoute])? {
        let pathComponents = Array(url.pathComponents.drop { $0 == "/"})
        let queryDict = queryDict(for: url)
        
        for routeType in routeTypes {
            if let path = routeType.path(from: pathComponents, queryDict: queryDict) {
                return path
            }
        }
        
        return nil
    }
    
    func queryDict(for url: URL) -> [String: String] {
        var dict = [String: String]()

        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems
        else {
            return dict
        }

        for item in queryItems {
            if let value = item.value {
                dict[item.name] = value
            }
        }

        return dict
    }
}
