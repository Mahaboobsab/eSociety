//
//  ValidationConstants.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//


import Foundation

enum ValidationRegex {
    static let email = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
    static let password = #"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"#
}

enum Validator {
    static func isValidEmail(_ email: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", ValidationRegex.email)
            .evaluate(with: email)
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        NSPredicate(format: "SELF MATCHES %@", ValidationRegex.password)
            .evaluate(with: password)
    }
}
