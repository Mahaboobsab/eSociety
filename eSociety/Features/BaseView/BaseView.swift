//
//  BaseView.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import SwiftUI
import ActivityIndicatorView

struct BaseView<Content: View>: View {
    let isLoading: Bool
    @Binding var toastMessage: String?
    
    // Alert bindings
    @Binding var showAlert: Bool
    @Binding var alertTitle: String
    @Binding var alertMessage: String
    
    let onToastDismiss: (() -> Void)?
    let content: () -> Content

    init(
        isLoading: Bool = false,
        toastMessage: Binding<String?> = .constant(nil),
        showAlert: Binding<Bool> = .constant(false),
        alertTitle: Binding<String> = .constant(""),
        alertMessage: Binding<String> = .constant(""),
        onToastDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isLoading = isLoading
        self._toastMessage = toastMessage
        self._showAlert = showAlert
        self._alertTitle = alertTitle
        self._alertMessage = alertMessage
        self.onToastDismiss = onToastDismiss
        self.content = content
    }

    var body: some View {
        ZStack {
            content()

            // Loader
            if isLoading {
                Color.black.opacity(0.2).ignoresSafeArea()
                ActivityIndicatorView(isVisible: .constant(true), type: .flickeringDots())
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }

            // Toast
            if let message = toastMessage {
                VStack {
                    Spacer()
                    Text(message)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut, value: message)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            toastMessage = nil
                        }
                        onToastDismiss?()   // fire callback
                    }
                }
            }
        }
        // Dynamic Alert
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                }
            )
        }
    }
}
