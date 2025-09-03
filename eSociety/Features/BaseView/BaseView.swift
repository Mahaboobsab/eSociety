//
//  BaseView.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import SwiftUI
import ActivityIndicatorView

/// A reusable base view wrapper that provides:
/// - A loading indicator overlay
/// - Toast notifications
/// - Alerts
/// - Custom content through generics
///
/// Use this as a parent container to ensure consistent UI behaviors across the app.
struct BaseView<Content: View>: View {
    
    // MARK: - Properties
    
    /// Whether the loading indicator should be visible.
    let isLoading: Bool
    
    /// A toast message to display at the bottom of the screen.
    @Binding var toastMessage: String?
    
    // MARK: - Alert Bindings
    
    /// Controls whether the alert is shown.
    @Binding var showAlert: Bool
    /// The alert title.
    @Binding var alertTitle: String
    /// The alert message.
    @Binding var alertMessage: String
    
    /// Callback triggered when the toast is dismissed.
    let onToastDismiss: (() -> Void)?
    
    /// The main content of the view.
    let content: () -> Content
    
    // MARK: - Initializer
    
    /// Initializes a new `BaseView`.
    ///
    /// - Parameters:
    ///   - isLoading: Controls the loading indicator.
    ///   - toastMessage: A binding for the toast text (dismisses automatically).
    ///   - showAlert: Binding to show/hide an alert.
    ///   - alertTitle: Binding for the alert's title.
    ///   - alertMessage: Binding for the alert's message.
    ///   - onToastDismiss: Optional callback fired when the toast disappears.
    ///   - content: A `@ViewBuilder` closure returning the main UI content.
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
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Base Content
            content()
            
            // Loader Overlay
            if isLoading {
                Color.black.opacity(0.2).ignoresSafeArea()
                ActivityIndicatorView(isVisible: .constant(true), type: .flickeringDots())
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }
            
            // Toast Notification
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
                    // Auto-dismiss toast after 2 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            toastMessage = nil
                        }
                        onToastDismiss?()   // Fire callback if provided
                    }
                }
            }
        }
        // Alert Presentation
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
