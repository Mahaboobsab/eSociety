//
//  Login.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import Foundation

// MARK: - LoginRequest
/// Represents the request payload for login API.
/// Conforms to `Codable` for easy JSON encoding/decoding.
struct LoginRequest: Codable {
    let userEmail, userPassword: String
}

// MARK: - LoginResponse
/// Represents the response payload returned by login API.
/// - Contains an optional error message and user data.
struct LoginResponse: Codable {
    let errorMessage: String?
    let data: DataClass
}

// MARK: - DataClass
/// Represents the user details returned from the login API.
struct DataClass: Codable {
    let userName: String
    let userID: Int
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"   // Map JSON key "userId" to Swift property `userID`
        case email
    }
}

// MARK: - API Extension
extension LoginRequest {
    /// Calls the login API with given request payload.
    ///
    /// - Parameter loginRequest: A `LoginRequest` containing user credentials.
    /// - Returns: A `LoginResponse` containing user details or error message.
    /// - Throws: Error if request fails or decoding is unsuccessful.
    /// - Complexity: **O(1)** → Single API request, constant time.
    func getUserDetails(loginRequest: LoginRequest) async throws -> LoginResponse {
        let response: LoginResponse = try await WebServiceManager.shared.postRequest(
            endpoint: .login,
            body: loginRequest
        )
        return response
    }
}
