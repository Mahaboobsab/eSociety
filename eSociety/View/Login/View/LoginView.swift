//
//  LoginView.swift
//  eSociety
//
//  Created by Alkit Gupta on 17/08/25.
//
import SwiftUI
import DesignColors
import CoreSwift

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            DesignColors.softWhite.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 20) {
                        Text(kesociety.localized)
                            .font(AppFont.robotoBold(size: 50))
                        
                        Text(kuserLogin.localized)
                            .font(AppFont.robotoBold(size: 30))
                    }
                    .padding(.top, 50)
                    .padding(.horizontal)
                    
                    VStack(spacing: 16) {
                        TextField(kemailID.localized, text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                            .inputFieldStyle()
                        
                        SecureField(kpassword.localized, text: $viewModel.password)
                            .textContentType(.password)
                            .inputFieldStyle()
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        Button(klogin.localized) {
                            // Handle login
                        }
                        .disabled(!viewModel.isFormValid)
                        .primaryButtonStyle(enabled: viewModel.isFormValid)
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 50)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
