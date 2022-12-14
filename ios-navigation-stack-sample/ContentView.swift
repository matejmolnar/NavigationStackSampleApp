//
//  ContentView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 05.10.2022.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
    @AppStorage("loggedIn") private var loggedIn: Bool = false
    
    var initialNavigationRoot: NavigationRoot {
        switch (onboardingCompleted, loggedIn) {
        case (_, true): return .tabBar
        case (true, false): return .login
        case (false, false): return .onboarding
        }
    }
}

struct ContentView: View {
    @StateObject var model: ContentViewModel
    @StateObject var router: Router
    
    init(model: ContentViewModel) {
        _model = .init(wrappedValue: model)
        _router = .init(wrappedValue: .init(root: model.initialNavigationRoot))
    }
    
    var body: some View {
        Group {
            switch router.root {
            case .onboarding:
                OnboardingView()
            case .login:
                LoginView(model: .init())
            case .tabBar:
                TabBarView()
            }
        }
        .animation(.default, value: router.root)
        .environmentObject(router)
        .onOpenURL { url in
            // You should parse URL and navigate to an appropriate view.
            
            router.root = .tabBar
            router.tabBar.selectedTab = 1
            router.tabBar.episodesPath = [
                .episode(Episode(name: "Deeplinked episode")),
                .character(character: Character(name: "Deeplinked character"), route: .sheet(.init(title: "Deeplinked sheet")))
            ]
        }
    }
}
