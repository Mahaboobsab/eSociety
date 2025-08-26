//
//  AppCoordinator.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 18/08/25.
//

import SwiftUI
import TermsModule

final class LoginCoordinator: ObservableObject, TermsDelegate {
    @Published var showTerms = false
    @Published var hasAcceptedTerms = false

    func didAcceptTerms() {
        hasAcceptedTerms = true
        showTerms = false
        print("✅ Terms accepted.")
    }
}
