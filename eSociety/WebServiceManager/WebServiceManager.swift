//
//  WebServiceManager.swift
//  MVVMDemo
//
//  Created by Mahaboob on 25/08/25.
//  Copyright © 2025 Meheboob. All rights reserved.
//

import UIKit
import Alamofire

typealias Response<T: Codable> = (Result<T, Error>) -> Void
struct None: Codable {} // Used when the response is empty

enum ResponseStatus: Int {
    case successCreation = 201
    case success = 200
    case successDeletion = 204
    case unauthorized = 401
    case notFound = 404
}

final class WebServiceManager {
    
    static let shared = WebServiceManager()
    private init() {}
    
    private func buildURL(endpoint: String) throws -> URL {
        let urlString = Bundle.main.baseURL + endpoint
        guard let encodedURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let url = URL(string: encodedURL) else {
            throw URLError(.badURL)
        }
        return url
    }

    // MARK: - GET
    func getRequest<T: Codable>(
        endpoint: String,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let url = try buildURL(endpoint: endpoint)
        let data = try await AF.request(url, method: .get, headers: headers)
            .validate()
            .serializingDecodable(T.self).value
        return data
    }

    // MARK: - POST
    func postRequest<T: Codable, U: Encodable>(
        endpoint: String,
        body: U,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let url = try buildURL(endpoint: endpoint)
        let data = try await AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .serializingDecodable(T.self).value
        return data
    }

    // MARK: - PUT
    func putRequest<T: Codable, U: Encodable>(
        endpoint: String,
        body: U,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let url = try buildURL(endpoint: endpoint)
        let data = try await AF.request(url, method: .put, parameters: body, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .serializingDecodable(T.self).value
        return data
    }

    // MARK: - DELETE
    func deleteRequest<T: Codable>(
        endpoint: String,
        headers: HTTPHeaders? = nil
    ) async throws -> T {
        let url = try buildURL(endpoint: endpoint)
        let data = try await AF.request(url, method: .delete, headers: headers)
            .validate()
            .serializingDecodable(T.self).value
        return data
    }
}

extension Bundle {
    var baseURL: String {
        "https://api.openweathermap.org/"
    }
}
