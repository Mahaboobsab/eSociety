//
//  WebServiceManager.swift
//  MVVMDemo
//
//  Created by Mahaboob on 25/08/25.
//  Copyright © 2025 Meheboob. All rights reserved.
//
//  Author: Mahaboobsab Nadaf
//  Description: Centralized network layer using Alamofire with async/await.
//  Provides GET, POST, PUT, DELETE helpers with Codable support.
//  Ensures consistent request handling and response decoding across the app.
//

import UIKit
import Alamofire

/// Generic completion response alias using Swift's `Result`
/// - T: A type that conforms to `Codable`
/// - Error: The error encountered if the request fails
typealias Response<T: Codable> = (Result<T, Error>) -> Void

/// Placeholder struct used when API response body is empty (e.g., 204 No Content)
struct None: Codable {}

/// Common HTTP response status codes used for better readability
enum ResponseStatus: Int {
    case successCreation = 201
    case success = 200
    case successDeletion = 204
    case unauthorized = 401
    case notFound = 404
}

/// Singleton class responsible for handling all network requests
/// using Alamofire with async/await for cleaner syntax.
final class WebServiceManager {
    
    /// Shared singleton instance (global access point)
    static let shared = WebServiceManager()
    
    /// Private initializer to enforce singleton usage
    private init() {}
    
    // MARK: - GET Request
    /// Performs a GET request to the given endpoint
    /// - Parameters:
    ///   - endpoint: API endpoint (defined in `APIEndpoint`)
    ///   - headers: Optional HTTP headers
    /// - Returns: Decoded response of type `T`
    /// - Throws: Network or decoding errors
    func getRequest<T: Codable>(
        endpoint: APIEndpoint,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let data = try await AF.request(endpoint.url, method: .get, headers: headers)
            .validate()
            .serializingDecodable(T.self).value
        return data
    }
    
    // MARK: - POST Request
    /// Performs a POST request to the given endpoint
    /// - Parameters:
    ///   - endpoint: API endpoint
    ///   - body: Encodable request body
    ///   - headers: Optional HTTP headers
    /// - Returns: Decoded response of type `T`
    /// - Throws: Network or decoding errors
    func postRequest<T: Codable, U: Encodable>(
        endpoint: APIEndpoint,
        body: U,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let data = try await AF.request(
            endpoint.url,
            method: .post,
            parameters: body,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
            .validate()
            .serializingDecodable(T.self).value
        return data
    }
    
    // MARK: - PUT Request
    /// Performs a PUT request to the given endpoint
    /// - Parameters:
    ///   - endpoint: API endpoint
    ///   - body: Encodable request body
    ///   - headers: Optional HTTP headers
    /// - Returns: Decoded response of type `T`
    /// - Throws: Network or decoding errors
    func putRequest<T: Codable, U: Encodable>(
        endpoint: APIEndpoint,
        body: U,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let data = try await AF.request(
            endpoint.url,
            method: .put,
            parameters: body,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
            .validate()
            .serializingDecodable(T.self).value
        return data
    }
    
    // MARK: - DELETE Request
    /// Performs a DELETE request to the given endpoint
    /// - Parameters:
    ///   - endpoint: API endpoint
    ///   - headers: Optional HTTP headers
    /// - Returns: Decoded response of type `T`
    /// - Throws: Network or decoding errors
    /// - Note: If the API returns no body, use `None` as the type.
    func deleteRequest<T: Codable>(
        endpoint: APIEndpoint,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let data = try await AF.request(
            endpoint.url,
            method: .delete,
            headers: headers
        )
            .validate()
            .serializingDecodable(T.self).value
        return data
    }
}
