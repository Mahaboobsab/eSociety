//
//  ViewModifiers.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI

// MARK: - InputFieldModifier
/// A custom `ViewModifier` for styling text input fields consistently across the app.
/// Applies padding, background, corner radius, and font styling to any text field.
struct InputFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(AppFont.roboto(size: 18))      // Sets consistent font for input
            .padding(.horizontal)                 // Horizontal padding inside the field
            .frame(height: 50)                    // Fixed height for all input fields
            .background(Color.white)              // White background for input fields
            .cornerRadius(8)                      // Rounded corners
    }
}

// MARK: - View Extension
/// Convenience extension to apply `InputFieldModifier` easily
extension View {
    /// Apply consistent input field style
    func inputFieldStyle() -> some View {
        self.modifier(InputFieldModifier())
    }
}
