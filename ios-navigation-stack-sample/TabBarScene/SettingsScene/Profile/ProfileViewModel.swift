//
//  ProfileViewModel.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 20.10.2022.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @AppStorage("userEmail") var userEmail: String = ""
    @AppStorage("premiumEnabled") var premiumEnabled: Bool = false
    
    func logout() {
        userEmail = ""
        premiumEnabled = false
    }
}
