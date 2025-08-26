//
//  AppCoordinator.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 18/08/25.
//

import SwiftUI
import TermsModule

enum LoginDestination: Hashable {
    case addNewFamily
}

final class LoginCoordinator: ObservableObject, TermsDelegate {
    @Published var showTerms = false
    @Published var hasAcceptedTerms: Bool {
        didSet {
            UserDefaults.standard.set(hasAcceptedTerms, forKey: termsKey)
            if hasAcceptedTerms { showTerms = false }
        }
    }
    
    @Published var navigationPath = NavigationPath()
    
    private let termsKey = "hasAcceptedTerms"

    init() {
        let accepted = UserDefaults.standard.bool(forKey: termsKey)
        self.hasAcceptedTerms = accepted
        self.showTerms = !accepted
    }

    func didAcceptTerms() {
        hasAcceptedTerms = true
    }

    func navigateToAddNewFamilyView() {
        navigationPath.append(LoginDestination.addNewFamily)
    }
}
