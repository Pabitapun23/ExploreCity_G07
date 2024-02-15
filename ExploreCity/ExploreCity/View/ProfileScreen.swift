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
    @EnvironmentObject var purchasedTickets: PurchasedTicketsList
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Form {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .padding(.vertical, 10.0)
                        
                        if let userName = loggedInUserName {
                            Text(userName)
                                .font(.headline)
                                .padding(.vertical, 10.0)
                        }
                        
                    } // HStack
                    
                    // History for purchased tickets
                    NavigationLink(destination: PurchasedTicketsListScreen()) {
                        HStack {
                            Image(systemName: "ticket.fill")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                            Text("Purchased Tickets")
                        } // HStack
                    }
                    
                    Button("Logout") {
                        logout()
                    }
                    .foregroundStyle(.red)
                    .padding(.vertical, 10.0)
                }
            } // VStack
            .navigationBarHidden(true) // Hide navigation bar if needed
        } // NavigationView            
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
    } // body
    
    private func logout() {
        isLoggedIn = false // Update the state to indicate logout
        UserDefaults.standard.removeObject(forKey: "LoggedInUserEmail")
    }
}

#Preview {
    ProfileScreen(isLoggedIn: .constant(true))
}
