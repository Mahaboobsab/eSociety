//
//  LoginView.swift
//  eSociety
//
//  Created by Alkit Gupta on 17/08/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.softWhite // Soft off-white background
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    Text("eSociety")
                        .font(.system(size: 50))
                    
                    Text("User Login")
                        .font(.system(size: 30))
                }
                .padding()
                
                VStack(spacing: 16) {
                    TextField("Username", text: $username)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                    
                    TextField("Password", text: $password)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                VStack(spacing: 20) {
                    Button("Login") {
                        // Handle login
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color(.lightGray))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


extension Color {
    static let softWhite = Color(red: 0.985, green: 0.985, blue: 0.985)
}
