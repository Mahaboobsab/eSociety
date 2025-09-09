//
//  ActivityViewModel.swift
//  eSociety
//
//  Created by Meheboob on 09/09/25.
//

import Foundation
import Combine

//@MainActor
//final class ActivitiesViewModel: ObservableObject {
//    @Published var activities: [Activity] = []
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String?
//
//    /// Fetches activities using WebServiceManager with async/await
//    func loadActivities() async {
//        isLoading = true
//        errorMessage = nil
//
//        do {
//            let response: ActivitiesResponse = try await WebServiceManager.shared.getRequest(endpoint: .fetchActivities)
//            
//            if response.status == "success" {
//                activities = response.activities
//            } else {
//                errorMessage = "Server responded with failure"
//            }
//        } catch {
//            errorMessage = error.localizedDescription
//        }
//
//        isLoading = false
//    }
//}


protocol ActivitiesServiceProtocol {
    func fetchActivities() async throws -> ActivitiesResponse
}

@MainActor
final class ActivitiesViewModel: ObservableObject {
    @Published var activities: [Activity] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service: ActivitiesServiceProtocol

    init(service: ActivitiesServiceProtocol = WebServiceManager.shared) {
        self.service = service
    }

    func loadActivities() async {
        isLoading = true
        errorMessage = nil

        do {
            let response = try await service.fetchActivities()
            if response.status == "success" {
                activities = response.activities
            } else {
                errorMessage = "Server responded with failure"
            }
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
