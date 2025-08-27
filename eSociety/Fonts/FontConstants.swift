//
//  FontConstants.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI

enum FontName {
    static let robotoRegular = "Roboto-Regular"
    static let robotoBold = "Roboto-Bold"
    static let robotoMedium = "Roboto-Medium"
    static let robotoLight = "Roboto-Light"
}

enum AppFont {
    static func roboto(size: CGFloat) -> Font {
        .custom(FontName.robotoRegular, size: size)
    }
    
    static func robotoBold(size: CGFloat) -> Font {
        .custom(FontName.robotoBold, size: size)
    }
    
    static func robotoMedium(size: CGFloat) -> Font {
        .custom(FontName.robotoMedium, size: size)
    }
    
    static func robotoLight(size: CGFloat) -> Font {
        .custom(FontName.robotoLight, size: size)
    }
    
    static func robotoRegular(size: CGFloat) -> Font {
        .custom(FontName.robotoRegular, size: size)
    }
}

