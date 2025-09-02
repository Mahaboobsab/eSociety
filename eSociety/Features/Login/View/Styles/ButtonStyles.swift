//
//  PrimaryButtonModifier.swift
//  eSociety
//
//  Created by Mahaboobsab Nadaf on 17/08/25.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    let isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(isEnabled ? Color(.black) : Color(.lightGray))
            .foregroundColor(isEnabled ? .white : .black)
            .cornerRadius(10)
            .opacity(isEnabled ? 1 : 0.5)
            .font(AppFont.robotoBold(size: 25))
    }
}

extension View {
    func primaryButtonStyle(enabled: Bool) -> some View {
        self.modifier(PrimaryButtonModifier(isEnabled: enabled))
    }
}
