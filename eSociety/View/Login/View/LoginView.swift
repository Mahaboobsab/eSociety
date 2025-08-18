//
//  LoginView.swift
//  eSociety
//
//  Created by Alkit Gupta on 17/08/25.
//
import SwiftUI
import DesignColors
import CoreSwift

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var coordinator = LoginCoordinator()

    var body: some View {
        ZStack {
            DesignColors.softWhite.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 20) {
                        Text(kesociety.localized)
                            .font(AppFont.robotoBold(size: 50))

                        Text(kuserLogin.localized)
                            .font(AppFont.robotoBold(size: 30))
                    }
                    .padding(.top, 50)
                    .padding(.horizontal)

                    VStack(spacing: 16) {
                        TextField(kemailID.localized, text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                            .inputFieldStyle()

                        SecureField(kpassword.localized, text: $viewModel.password)
                            .textContentType(.password)
                            .inputFieldStyle()
                    }
                    .padding(.horizontal)

                    VStack(spacing: 20) {
                        Button(klogin.localized) {
                            // Handle login
                        }
                        .disabled(!viewModel.isFormValid || !coordinator.hasAcceptedTerms)
                        .primaryButtonStyle(enabled: viewModel.isFormValid && coordinator.hasAcceptedTerms)
                    }
                    .padding(.horizontal)

                    Spacer(minLength: 50)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                coordinator.showTerms = true
            }
        }
        .sheet(isPresented: $coordinator.showTerms) {
            TermsViewWrapper(delegate: coordinator)
        }
    }
}
