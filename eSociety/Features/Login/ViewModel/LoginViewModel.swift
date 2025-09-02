//
//  LoginViewModel.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import Foundation
import SwiftUI

protocol UserLoginViewModelProtocol: AnyObject, Sendable {
    func getUserDetails(loginRequest: LoginRequest) async throws -> LoginResponse
}

@MainActor
final class LoginViewModel: ObservableObject, UserLoginViewModelProtocol {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    
    // MARK: - Validation
    var isEmailValid: Bool {
        Validator.isValidEmail(email)
    }
    
    var isPasswordValid: Bool {
        Validator.isValidPassword(password)
    }
    
    var isFormValid: Bool {
        isEmailValid && isPasswordValid
    }
    
    func getUserDetails(loginRequest: LoginRequest) async throws -> LoginResponse {
        isLoading = true
        defer { isLoading = false }
        
        return try await WebServiceManager.shared.postRequest(
            endpoint: .login,
            body: loginRequest
        )
    }
}
