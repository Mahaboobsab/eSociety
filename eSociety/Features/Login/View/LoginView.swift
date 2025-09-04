//
//  LoginView.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI
import DesignColors
import CoreSwift
import SwiftData

// MARK: - LoginView
/// SwiftUI view for user login screen.
/// Handles:
/// - User email/password input
/// - Form validation
/// - Login API call via `LoginViewModel`
/// - Terms & Conditions display via `LoginCoordinator`
/// - Navigation to MainView after login
struct LoginView: View {
    
    // MARK: - State & Environment
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var toast: String? = nil
    
    @StateObject private var viewModel = LoginViewModel()      // ViewModel handling login logic
    @StateObject private var coordinator = LoginCoordinator()  // Handles terms & navigation
    
    @Environment(\.modelContext) private var context           // SwiftData context for DB
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            
            // BaseView handles loader, toast, and alerts dynamically
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
                    DesignColors.softWhite.ignoresSafeArea() // Background color
                    
                    ScrollView {
                        VStack(spacing: 32) {
                            
                            // MARK: - App Titles
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
                            
                            // MARK: - Input Fields
                            VStack(spacing: 16) {
                                TextField(kemailID.localized, text: $viewModel.email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .textContentType(.emailAddress)
                                    .inputFieldStyle() // Custom modifier for text fields
                                    .accessibilityIdentifier("EmailField")
                                
                                SecureField(kpassword.localized, text: $viewModel.password)
                                    .textContentType(.password)
                                    .inputFieldStyle()
                                    .accessibilityIdentifier("PasswordField")
                            }
                            .padding(.horizontal)
                            
                            // MARK: - Login Button
                            VStack(spacing: 20) {
                                Button(klogin.localized) {
                                    Task {
                                        let request = LoginRequest(
                                            userEmail: viewModel.email,
                                            userPassword: "1234" // FIXME: → Replace with viewModel.password in production
                                        )
                                        do {
                                            let response = try await viewModel.getUserDetails(loginRequest: request)
                                            // TODO: → Add in localization Constants
                                            toast = "✅ Login successful: \(response.data.userName)"
                                        } catch {
                                            // TODO: → Add in localization Constants
                                            alertTitle = "Login Failed"
                                            alertMessage = error.localizedDescription
                                            showAlert = true
                                        }
                                    }
                                }
                                .disabled(!viewModel.isFormValid || !coordinator.hasAcceptedTerms) // Only enable if form is valid and terms accepted
                                .primaryButtonStyle(enabled: viewModel.isFormValid && coordinator.hasAcceptedTerms)
                                .accessibilityIdentifier("LoginButton")
                            }
                            .padding(.horizontal)
                            
                            Spacer(minLength: 50)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                // MARK: - Terms & Conditions Sheet
                .sheet(isPresented: $coordinator.showTerms) {
                    TermsViewWrapper(delegate: coordinator)
                        .accessibilityIdentifier("TermsSheet")
                }
            }
            // MARK: - Navigation Destination
            .navigationDestination(for: LoginDestination.self) { dest in
                switch dest {
                case .mainView:
                    MainView()
                        .accessibilityIdentifier("MainView")
                }
            }
        }
        .onAppear {
            printSwiftDataStorePath(context: context)
        }
    }
    
    
    // MARK: - Helper Methods
    /// Prints the SQLite path used by SwiftData
    /// Useful for debugging database storage location
    /// - Parameter context: ModelContext from SwiftData
    
    //TODO: - Move this Logic to ViewModel & Implement SOLID principles
    func printSwiftDataStorePath(context: ModelContext) {
        if let path = context.container.configurations.first?.url.path(percentEncoded: false) {
            Logger.debug("📁 SwiftData SQLite path: \(path)")
        } else {
            Logger.debug("❌ Could not find SwiftData store path.")
        }
    }
}

// MARK: - Preview
#Preview {
    LoginView()
}
