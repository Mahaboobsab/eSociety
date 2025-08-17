//
//  String+Extension.swift
//  eSociety
//
//  Created by Alkit Gupta on 17/08/25.
//

import Foundation

extension String {
    func localized(comment: String = "") -> String {
        NSLocalizedString(self, comment: comment)
    }
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
