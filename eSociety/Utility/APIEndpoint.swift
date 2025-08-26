//
//  APIEndpoint.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import Foundation

enum APIEndpoint {
    case login
    case signUp
    case fetchProfile(userId: String)
    case updateSettings
    case custom(path: String)

    var path: String {
        switch self {
        case .login:
            return "api/User/Login"
        case .signUp:
            return "auth/signup"
        case .fetchProfile(let userId):
            return "users/\(userId)/profile"
        case .updateSettings:
            return "settings/update"
        case .custom(let path):
            return path
        }
    }

    var url: URL {
        let baseURL = URL(string: "https://api-dev-scus-demo.azurewebsites.net/")!
        return baseURL.appendingPathComponent(path)
    }
}
