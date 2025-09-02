//
//  TermsViewWrapper.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 18/08/25.
//

import SwiftUI
import TermsModule

struct TermsViewWrapper: UIViewControllerRepresentable {
    weak var delegate: TermsDelegate?

    func makeUIViewController(context: Context) -> TermsViewController {
        TermsViewController(delegate: delegate)
    }

    func updateUIViewController(_ uiViewController: TermsViewController, context: Context) {}
}
