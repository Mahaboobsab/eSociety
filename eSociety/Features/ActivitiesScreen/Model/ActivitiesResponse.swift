//
//  ActivitiesResponse.swift
//  eSociety
//
//  Created by Meheboob on 09/09/25.
//

struct ActivitiesResponse: Codable {
    let status: String
    let activities: [Activity]
}

struct Activity: Codable, Identifiable {
    let id: Int
    let title: String
    let activityDate: String
    let location: String
    let isCompleted: Bool

    // Custom CodingKeys to match JSON keys
    enum CodingKeys: String, CodingKey {
        case id = "activity_id"
        case title
        case activityDate = "activity_date"
        case location
        case isCompleted = "is_completed"
    }

    // Custom decoding to convert "0"/"1" string to Bool
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idString = try container.decode(String.self, forKey: .id)
        id = Int(idString) ?? 0
        title = try container.decode(String.self, forKey: .title)
        activityDate = try container.decode(String.self, forKey: .activityDate)
        location = try container.decode(String.self, forKey: .location)
        let completedString = try container.decode(String.self, forKey: .isCompleted)
        isCompleted = completedString == "1"
    }
}
