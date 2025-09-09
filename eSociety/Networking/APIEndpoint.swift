//
//  APIEndpoint.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import Foundation

enum APIEndpoint {
    case login
    case fetchActivities
    case fetchProfile(userId: String)
    case updateSettings
    case custom(path: String)
    
    public var path: String {
        switch self {
        case .login:
            return "esociety/login.php"
        case .fetchActivities:
            return "esociety/fetchActivities.php"
        case .fetchProfile(let userId):
            return "users/\(userId)/profile"
        case .updateSettings:
            return "settings/update"
        case .custom(let path):
            return path
        }
    }
    
    var url: URL {
        let baseURL = URL(string: "http://localhost:8080/")!
        return baseURL.appendingPathComponent(path)
    }
    
    
}
