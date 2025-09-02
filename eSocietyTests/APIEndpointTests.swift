//
//  APIEndpointTests.swift
//  eSociety
//
//  Created by Meheboob on 02/09/25.
//

import Foundation
import Testing
@testable import eSociety

@Suite("APIEndpoint Tests")
struct APIEndpointTests {
    
    @Test("Login endpoint should have correct path and URL")
    func testLoginEndpoint() {
        let endpoint = APIEndpoint.login
        #expect(endpoint.path == "api/User/Login")
        #expect(endpoint.url.absoluteString == "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")
    }
    
    @Test("SignUp endpoint should have correct path and URL")
    func testSignUpEndpoint() {
        let endpoint = APIEndpoint.signUp
        #expect(endpoint.path == "auth/signup")
        #expect(endpoint.url.absoluteString == "https://api-dev-scus-demo.azurewebsites.net/auth/signup")
    }
    
    @Test("FetchProfile endpoint should include userId in path and URL")
    func testFetchProfileEndpoint() {
        let endpoint = APIEndpoint.fetchProfile(userId: "12345")
        #expect(endpoint.path == "users/12345/profile")
        #expect(endpoint.url.absoluteString == "https://api-dev-scus-demo.azurewebsites.net/users/12345/profile")
    }
    
    @Test("UpdateSettings endpoint should have correct path and URL")
    func testUpdateSettingsEndpoint() {
        let endpoint = APIEndpoint.updateSettings
        #expect(endpoint.path == "settings/update")
        #expect(endpoint.url.absoluteString == "https://api-dev-scus-demo.azurewebsites.net/settings/update")
    }
    
    @Test("Custom endpoint should return custom path and URL")
    func testCustomEndpoint() {
        let customPath = "custom/endpoint"
        let endpoint = APIEndpoint.custom(path: customPath)
        #expect(endpoint.path == customPath)
        #expect(endpoint.url.absoluteString == "https://api-dev-scus-demo.azurewebsites.net/\(customPath)")
    }
}
