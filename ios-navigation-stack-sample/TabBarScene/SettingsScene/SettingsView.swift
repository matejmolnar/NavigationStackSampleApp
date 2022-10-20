//
//  SettingsView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack(path: $router.tabBar.settingsPath) {
            VStack {
                Button {
                    router.tabBar.settingsPath.append(.profile)
                } label: {
                    Text("User profile")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingsRoute.self) { route in
                switch route {
                case .profile:
                    ProfileView(model: .init())
                }
            }
        }
    }
}

