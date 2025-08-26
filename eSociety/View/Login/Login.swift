//
//  Login.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import Foundation


// MARK: - LoginRequest
struct LoginRequest: Codable {
    let userEmail, userPassword: String
}

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let errorMessage: String?
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
