//
//  ViewModifiers.swift
//  eSociety
//
//  Created by Alkit Gupta on 17/08/25.
//

import SwiftUI

struct InputFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(AppFont.roboto(size: 18))
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(8)
    }
}

extension View {
    func inputFieldStyle() -> some View {
        self.modifier(InputFieldModifier())
    }
}
