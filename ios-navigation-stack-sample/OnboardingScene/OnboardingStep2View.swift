//
//  OnboardingStep2View.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

class OnboardingStep2ViewModel: ObservableObject {
    @AppStorage("onboardingCompleted") private var onboardingCompleted: Bool = false
    
    func tapLogin() {
        onboardingCompleted = true
    }
}

struct OnboardingStep2View: View {
    @StateObject var model: OnboardingStep2ViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack {
            Button {
                model.tapLogin()
                router.root = .login
            } label: {
                Text("Login")
            }
        }
        .navigationTitle("Second Step")
    }
}
