//
//  OnboardingView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        NavigationStack(path: $router.onboardingPath) {
            VStack {
                Button {
                    router.onboardingPath.append(.step1)
                } label: {
                    Text("Next")
                }
            }
            .navigationTitle("Welcome")
            .navigationDestination(for: OnboardingRoute.self) { route in
                switch route {
                case .step1:
                    OnboardingStep1View()
                case .step2:
                    OnboardingStep2View(model: .init())
                }
            }
        }
    }
}
