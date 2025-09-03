//
//  PrimaryButtonModifier.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI

// MARK: - PrimaryButtonModifier
/// A custom `ViewModifier` to style buttons consistently as primary buttons.
/// Handles appearance based on `isEnabled` state:
/// - Enabled: Black background with white text
/// - Disabled: Light gray background with black text and reduced opacity
struct PrimaryButtonModifier: ViewModifier {
    
    /// Determines whether the button is enabled or disabled
    let isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50)          // Full width button with minimum height
            .background(isEnabled ? Color(.black) : Color(.lightGray)) // Background color based on state
            .foregroundColor(isEnabled ? .white : .black)      // Text color based on state
            .cornerRadius(10)                                  // Rounded corners
            .opacity(isEnabled ? 1 : 0.5)                      // Dimmed appearance if disabled
            .font(AppFont.robotoBold(size: 25))               // Font styling
    }
}

// MARK: - View Extension
/// Provides a convenient modifier function for any view to use primary button style
extension View {
    /// Apply the `PrimaryButtonModifier` to a view
    /// - Parameter enabled: Bool indicating if the button is enabled or disabled
    /// - Returns: Styled view as primary button
    func primaryButtonStyle(enabled: Bool) -> some View {
        self.modifier(PrimaryButtonModifier(isEnabled: enabled))
    }
}
