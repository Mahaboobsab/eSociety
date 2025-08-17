//
//  LoginViewModel.swift
//  eSociety
//
//  Created by Alkit Gupta on 17/08/25.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
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
}
