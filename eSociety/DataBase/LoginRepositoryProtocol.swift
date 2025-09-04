//
//  LoginRepositoryProtocol.swift
//  eSociety
//
//  Created by Meheboob on 04/09/25.
//

protocol LoginRepositoryProtocol {
    func saveUser(_ user: Resident) async throws
    func getStorePath() -> String?
}
