//
//  ProfileScreen.swift
//  Project
//
//  Created by Vaishnavi Selvakumar Selvakumar on 2024-02-14.
//

import SwiftUI

struct ProfileScreen: View {
    @Binding var isLoggedIn: Bool // Use binding to update the state
    @State private var loggedInUserName: String?
    
    var body: some View {
        VStack {
            Spacer()
            
            if let userName = loggedInUserName {
                Text("Logged in as \(userName)")
                    .font(.title)
                    .padding()
            }
            
            Button("Logout") {
                logout()
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            // Retrieve loggedInUserName from UserDefaults
            if let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") {
                loggedInUserName = loggedInUserEmail
            }
        }
        .onDisappear {
            // Clear loggedInUserName when navigating away from ProfileScreen
            loggedInUserName = nil
        }
    }
    
    private func logout() {
        isLoggedIn = false // Update the state to indicate logout
        UserDefaults.standard.removeObject(forKey: "LoggedInUserEmail")
    }
}

#Preview {
    ProfileScreen(isLoggedIn: .constant(true))
}
