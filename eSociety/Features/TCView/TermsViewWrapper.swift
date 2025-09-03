//
//  TermsViewWrapper.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 18/08/25.
//

import SwiftUI
import TermsModule

/// A SwiftUI wrapper for `TermsViewController` from **TermsModule**.
///
/// This allows UIKit-based `TermsViewController` to be embedded inside a SwiftUI view hierarchy.
/// It uses the `UIViewControllerRepresentable` protocol for bridging.
///
/// - Author: Meheboob
/// - Use Case: Integrate UIKit terms screen into SwiftUI projects.
struct TermsViewWrapper: UIViewControllerRepresentable {
    
    /// Delegate for handling events/actions from `TermsViewController`.
    weak var delegate: TermsDelegate?
    
    // MARK: - UIViewControllerRepresentable
    
    /// Creates and configures the `TermsViewController`.
    func makeUIViewController(context: Context) -> TermsViewController {
        TermsViewController(delegate: delegate)
    }
    
    /// Updates the `TermsViewController` when SwiftUI state changes.
    /// Currently unused as `TermsViewController` does not require updates.
    func updateUIViewController(_ uiViewController: TermsViewController, context: Context) {}
}
