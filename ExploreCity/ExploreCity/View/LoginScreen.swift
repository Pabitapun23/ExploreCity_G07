//
//  LoginScreen.swift
//  Project
//
//  Created by Tech on 2024-02-12.
//
import SwiftUI

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @Binding var isLoggedIn: Bool // Use binding to update the state
    @State private var errorMessage: String? // Hold error message
    @State private var loggedInUserEmail: String? // Hold the logged-in user's email
    
    let users: [User] = [
        User(email: "user1@gmail.com", password: "123456"),
        User(email: "user2@gmail.com", password: "123456")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Image("logo_light")
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                
                HStack {
                    Text("Welcome to")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                    
                    Text("ExploreCity")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                } // HStack
                .padding(.bottom, 40.0)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                
                TextField("Email", text: $email)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                
                Toggle("Remember Me", isOn: $rememberMe)
                    .padding(.horizontal)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button("Login") {
                    login()
                }
                .padding(.horizontal, 20.0)
                .padding(.vertical, 13.0)
                .background(Color.green)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: ActivityList(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .isDetailLink(false)
                .hidden()
                  
                
            } // VStack
            .padding()
            .onAppear {
                // Retrieve rememberMe status from UserDefaults
                rememberMe = UserDefaults.standard.bool(forKey: "RememberMeStatus")
                // If rememberMe is true, retrieve the previously logged-in user's email and password
                if rememberMe {
                    if let savedEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail"),
                       let savedPassword = UserDefaults.standard.string(forKey: "LoggedInUserPassword") {
                        email = savedEmail
                        password = savedPassword
                        loggedInUserEmail = savedEmail // Set loggedInUserEmail
                        
                        // Automatically log in the user if rememberMe is true
                        login()
                    }
                }
            } // .onAppear
            
        } // NavigationView
        
    } // body
    
    func login() {
        for user in users {
            if user.email == email && user.password == password {
                isLoggedIn = true // Update the state
                loggedInUserEmail = user.email // Update loggedInUserEmail
                if rememberMe {
                    // Save rememberMe status to UserDefaults
                    UserDefaults.standard.set(rememberMe, forKey: "RememberMeStatus")
                    // Save logged-in user's email and password to UserDefaults
                    UserDefaults.standard.set(user.email, forKey: "LoggedInUserEmail")
                    UserDefaults.standard.set(user.password, forKey: "LoggedInUserPassword")
                } else {
                    // If rememberMe is false, clear the saved user's email and password from UserDefaults
                    UserDefaults.standard.removeObject(forKey: "LoggedInUserEmail")
                    UserDefaults.standard.removeObject(forKey: "LoggedInUserPassword")
                }
                errorMessage = nil // Clear error message
                return
            }
        }
        // If login fails, display error message
        errorMessage = "Invalid credentials"
    } // func
}

#Preview {
    // Pass a binding to isLoggedIn
    LoginScreen(isLoggedIn: .constant(false))
}
