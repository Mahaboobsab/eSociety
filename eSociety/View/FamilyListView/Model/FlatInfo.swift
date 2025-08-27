//
//  FlatInfo.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//
import Foundation

struct FlatInfo: Identifiable {
    let id = UUID()
    let flatNumber: String
    let ownerName: String
    let contact: String
    let residents: Int8
    let owneship: String
}
