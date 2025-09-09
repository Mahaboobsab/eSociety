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
        #expect(endpoint.path == "esociety/login.php")
        #expect(endpoint.url.absoluteString == "http://localhost:8080/esociety/login.php")
    }
    
    @Test("FetchActivities endpoint should have correct path and URL")
    func testFetchActivitiesEndpoint() {
        let endpoint = APIEndpoint.fetchActivities
        #expect(endpoint.path == "esociety/fetchActivities.php")
        #expect(endpoint.url.absoluteString == "http://localhost:8080/esociety/fetchActivities.php")
    }
    
    @Test("FetchProfile endpoint should include userId in path and URL")
    func testFetchProfileEndpoint() {
        let endpoint = APIEndpoint.fetchProfile(userId: "12345")
        #expect(endpoint.path == "users/12345/profile")
        #expect(endpoint.url.absoluteString == "http://localhost:8080/users/12345/profile")
    }
    
    @Test("UpdateSettings endpoint should have correct path and URL")
    func testUpdateSettingsEndpoint() {
        let endpoint = APIEndpoint.updateSettings
        #expect(endpoint.path == "settings/update")
        #expect(endpoint.url.absoluteString == "http://localhost:8080/settings/update")
    }
    
    @Test("Custom endpoint should return custom path and URL")
    func testCustomEndpoint() {
        let customPath = "custom/endpoint"
        let endpoint = APIEndpoint.custom(path: customPath)
        #expect(endpoint.path == customPath)
        #expect(endpoint.url.absoluteString == "http://localhost:8080/\(customPath)")
    }
}
