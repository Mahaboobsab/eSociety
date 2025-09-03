//
//  AppCoordinator.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 18/08/25.
//

import SwiftUI
import TermsModule

// MARK: - Navigation Destinations
/// Defines possible destinations for navigation after login.
/// Conforms to `Hashable` for use with SwiftUI's `NavigationPath`.
enum LoginDestination: Hashable {
    case mainView
}

// MARK: - LoginCoordinator
/// Coordinator class responsible for handling login flow,
/// terms acceptance, and navigation.
///
/// - Author: Mahaboobsab Nadaf
/// - Responsibilities:
///   - Track terms acceptance
///   - Show Terms & Conditions screen if needed
///   - Manage navigation path for login-related flows
final class LoginCoordinator: ObservableObject, TermsDelegate {
    
    // MARK: - Published Properties
    /// Controls whether the Terms screen should be shown.
    @Published var showTerms = false
    
    /// Tracks whether the user has accepted Terms & Conditions.
    /// Stored in `UserDefaults` for persistence.
    @Published var hasAcceptedTerms: Bool {
        didSet {
            UserDefaults.standard.set(hasAcceptedTerms, forKey: termsKey)
            if hasAcceptedTerms { showTerms = false }
        }
    }
    
    /// Navigation stack path for handling SwiftUI navigation.
    @Published var navigationPath = NavigationPath()
    
    // MARK: - Private Properties
    /// Key used for storing terms acceptance flag in `UserDefaults`.
    private let termsKey = "hasAcceptedTerms"
    
    // MARK: - Initializer
    /// Initializes coordinator with persisted terms acceptance state.
    init() {
        let accepted = UserDefaults.standard.bool(forKey: termsKey)
        self.hasAcceptedTerms = accepted
        self.showTerms = !accepted
    }
    
    // MARK: - TermsDelegate
    /// Called when user accepts Terms & Conditions.
    func didAcceptTerms() {
        hasAcceptedTerms = true
    }
    
    // MARK: - Navigation
    /// Navigates user to main view after login success.
    func navigateToAddNewFamilyView() {
        navigationPath.append(LoginDestination.mainView)
    }
}
