//
//  LoginViewModel.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import Foundation
import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    
    // MARK: - Validation
    var isEmailValid: Bool { Validator.isValidEmail(email) }
    var isPasswordValid: Bool { Validator.isValidPassword(password) }
    var isFormValid: Bool { isEmailValid && isPasswordValid }
    
    // MARK: - API Call
       /// Calls login API to fetch user details.
       ///
       /// - Parameter loginRequest: User credentials
       /// - Returns: A `LoginResponse` containing user info or error.
       /// - Throws: Error if request fails.
       /// - Complexity: **O(1)** → One network call, constant time.
       ///
    func getUserDetails(loginRequest: LoginRequest) async throws -> LoginResponse {
        isLoading = true
        defer { isLoading = false } // Ensure spinner stops

        /*
         ┌─────────────────────────────┐
         │ User taps "Login" button    │
         └─────────────┬──────────────┘
                       │
                       ▼
         ┌─────────────────────────────┐
         │ getUserDetails() called     │
         │ (async)                     │
         └─────────────┬──────────────┘
                       │
                       ▼
         ┌─────────────────────────────┐
         │ @MainActor ensures all code │
         │ runs on main thread         │
         └─────────────┬──────────────┘
                       │
                       ▼
         ┌─────────────────────────────┐
         │ isLoading = true            │
         │ Triggers SwiftUI update     │
         └─────────────┬──────────────┘
                       │
                       ▼
         ┌─────────────────────────────┐
         │ Await API response          │
         │ (WebServiceManager call)    │
         └─────────────┬──────────────┘
                       │
                       ▼
         ┌─────────────────────────────┐
         │ Response received           │
         │ Update @Published props     │
         │ UI updates automatically    │
         └─────────────────────────────┘
        */
        
        return try await WebServiceManager.shared.postRequest(
            endpoint: .login,
            body: loginRequest
        )
    }
}
