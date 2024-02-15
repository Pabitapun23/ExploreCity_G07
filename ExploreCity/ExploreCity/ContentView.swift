//
//  ContentView.swift
//  ExploreCity
//
//  Created by Vaishnavi on 2024-02-08.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            // If logged in, show the TabView with navigation
            TabView {
                NavigationView {
                    ActivityList()
                        //.navigationTitle("Activity List")
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Activities")
                }
                
                NavigationView {
                    FavoriteList()
                       // .navigationTitle("Favorites")
                }
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                
                // History for purchased tickets
                NavigationView {
                    PurchasedTicketsListScreen()
                       // .navigationTitle("Favorites")
                }
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("Purchased Tickets")
                }
                
                NavigationView {
                    ProfileScreen(isLoggedIn: $isLoggedIn)
                      //  .navigationTitle("Profile")
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
        } else {
            // If not logged in, show the LoginScreen
            LoginScreen(isLoggedIn: $isLoggedIn)
        }
    } // body
}

#Preview {
    ContentView()
}
