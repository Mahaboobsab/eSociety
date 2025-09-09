//
//  WebServiceManager+ActivitiesService.swift .swift
//  eSociety
//
//  Created by Meheboob on 09/09/25.
//

extension WebServiceManager: ActivitiesServiceProtocol {
    func fetchActivities() async throws -> ActivitiesResponse {
        try await getRequest(endpoint: .fetchActivities)
    }
}
