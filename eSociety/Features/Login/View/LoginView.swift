//
//  LoginView.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI
import DesignColors
import CoreSwift

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var coordinator = LoginCoordinator()
    
    @State private var toast: String? = nil
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            BaseView(
                isLoading: viewModel.isLoading,
                toastMessage: $toast,
                showAlert: $showAlert,
                alertTitle: $alertTitle,
                alertMessage: $alertMessage,
                onToastDismiss: {
                    coordinator.navigateToAddNewFamilyView()
                }
            ) {
                ZStack {
                    DesignColors.softWhite.ignoresSafeArea()
                    
                    ScrollView {
                        VStack(spacing: 32) {
                            VStack(spacing: 20) {
                                Text(kesociety.localized)
                                    .font(AppFont.robotoBold(size: 50))
                                    .accessibilityIdentifier("AppTitle")
                                
                                Text(kuserLogin.localized)
                                    .font(AppFont.robotoBold(size: 30))
                                    .accessibilityIdentifier("LoginTitle")
                            }
                            .padding(.top, 50)
                            .padding(.horizontal)
                            
                            VStack(spacing: 16) {
                                TextField(kemailID.localized, text: $viewModel.email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .textContentType(.emailAddress)
                                    .inputFieldStyle()
                                    .accessibilityIdentifier("EmailField")
                                
                                SecureField(kpassword.localized, text: $viewModel.password)
                                    .textContentType(.password)
                                    .inputFieldStyle()
                                    .accessibilityIdentifier("PasswordField")
                            }
                            .padding(.horizontal)
                            
                            VStack(spacing: 20) {
                                Button(klogin.localized) {
                                    Task {
                                        let request = LoginRequest(
                                            userEmail: viewModel.email,
                                            userPassword: "1234" // replace with viewModel.password
                                        )
                                        do {
                                            let response = try await viewModel.getUserDetails(loginRequest: request)
                                            toast = "✅ Login successful: \(response.data.userName)"
                                        } catch {
                                            alertTitle = "Login Failed"
                                            alertMessage = error.localizedDescription
                                            showAlert = true
                                        }
                                    }
                                }
                                .disabled(!viewModel.isFormValid || !coordinator.hasAcceptedTerms)
                                .primaryButtonStyle(enabled: viewModel.isFormValid && coordinator.hasAcceptedTerms)
                                .accessibilityIdentifier("LoginButton")
                            }
                            .padding(.horizontal)
                            
                            Spacer(minLength: 50)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .sheet(isPresented: $coordinator.showTerms) {
                    TermsViewWrapper(delegate: coordinator)
                        .accessibilityIdentifier("TermsSheet")
                }
            }
            .navigationDestination(for: LoginDestination.self) { dest in
                switch dest {
                case .mainView:
                    MainView()
                        .accessibilityIdentifier("MainView")
                }
            }
        }
    }
}



#Preview {
    LoginView()
}
