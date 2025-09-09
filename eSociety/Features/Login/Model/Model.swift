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
    let email: String
    let password: String
}

// MARK: - LoginResponse
/// Represents the response payload returned by login API.
/// - Contains an optional error message and user data.

struct LoginResponse: Codable {
    let status: String
    let message: String?
    let admin: AdminData?
}

struct AdminData: Codable {
    let admin_id: Int
    let name: String
    let email: String
    let role: String
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
