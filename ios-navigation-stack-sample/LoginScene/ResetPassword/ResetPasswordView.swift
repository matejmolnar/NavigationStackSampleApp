//
//  ResetPasswordView.swift
//  ios-navigation-stack-sample
//
//  Created by Matej Molnár on 18.10.2022.
//

import SwiftUI

struct ResetPasswordView: View {
    @StateObject var model: ResetPasswordViewModel
    
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss
    @State private var error: Error?
    
    var body: some View {
        VStack {
            TextField("Email", text: $model.email)
                .textContentType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                resetPassword()
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 50)
        .alert(isPresented: .constant(error != nil)) {
            Alert(
                title: Text("Reset password failed"),
                message: Text(error?.localizedDescription ?? ""),
                dismissButton: .default(Text("OK")) {
                    error = nil
                }
            )
        }
    }
}

extension ResetPasswordView {
    func resetPassword() {
        do {
            try model.resetPassword()
            dismiss()
        } catch {
            self.error = error
        }
    }
}
