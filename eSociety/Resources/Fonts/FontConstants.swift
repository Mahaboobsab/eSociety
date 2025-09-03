//
//  FontConstants.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI

// MARK: - Font Names
/// Centralized constants for custom font names used in the app.
enum FontName {
    static let robotoRegular = "Roboto-Regular"
    static let robotoBold = "Roboto-Bold"
    static let robotoMedium = "Roboto-Medium"
    static let robotoLight = "Roboto-Light"
}

// MARK: - AppFont
/// Convenience wrapper to use custom fonts with specific sizes in SwiftUI.
/// Usage: Text("Hello").font(AppFont.robotoBold(size: 20))
enum AppFont {
    
    /// Roboto Regular font
    static func roboto(size: CGFloat) -> Font {
        .custom(FontName.robotoRegular, size: size)
    }
    
    /// Roboto Bold font
    static func robotoBold(size: CGFloat) -> Font {
        .custom(FontName.robotoBold, size: size)
    }
    
    /// Roboto Medium font
    static func robotoMedium(size: CGFloat) -> Font {
        .custom(FontName.robotoMedium, size: size)
    }
    
    /// Roboto Light font
    static func robotoLight(size: CGFloat) -> Font {
        .custom(FontName.robotoLight, size: size)
    }
    
    /// Alias for Roboto Regular font
    static func robotoRegular(size: CGFloat) -> Font {
        .custom(FontName.robotoRegular, size: size)
    }
}
