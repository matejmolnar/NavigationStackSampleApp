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
    
    private lazy var deepLinkAuthorizator = DeepLinkAuthorizator()
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
        guard let routeData = path(from: url) else {
            throw DeepLinkError.invalidURL
        }
        
        guard deepLinkAuthorizator.isRouteDataAuthorized(routeData) else {
            throw DeepLinkError.unauthorized
        }
        
        switch routeData.type {
        case is OnboardingRoute.Type:
            root = .onboarding
            onboardingPath = routeData.path as! [OnboardingRoute]
        case is LoginRoute.Type:
            root = .login
            loginPath = routeData.path as! [LoginRoute]
        case is SettingsRoute.Type:
            root = .tabBar
            tabBar.isSettingsPresented = true
            tabBar.settingsPath = routeData.path as! [SettingsRoute]
        case is EpisodesRoute.Type:
            root = .tabBar
            tabBar.selectedTab = .episodes
            tabBar.episodesPath = routeData.path as! [EpisodesRoute]
        case is CharactersRoute.Type:
            root = .tabBar
            tabBar.selectedTab = .characters
            tabBar.charactersPath = routeData.path as! [CharactersRoute]
        default: break
        }
    }
}

// MARK: - Private functions
private extension Router {
    func path(from url: URL) -> NavigationRouteData? {
        // In case the first path component is "/" it gets removed
        let pathComponents = Array(url.pathComponents.drop { $0 == "/"})
        let queryDict = queryDict(for: url)
        
        for routeType in routeTypes {
            if let path = routeType.path(from: pathComponents, queryDict: queryDict) {
                return NavigationRouteData(routeType, path)
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
