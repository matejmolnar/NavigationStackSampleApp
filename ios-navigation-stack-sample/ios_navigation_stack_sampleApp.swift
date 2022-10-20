//
//  ios_navigation_stack_sampleApp.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 05.10.2022.
//

import SwiftUI
import DependencyInjection

@main
struct ios_navigation_stack_sampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: .init())
        }
    }
}
