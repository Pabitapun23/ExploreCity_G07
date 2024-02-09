//
//  HomeScreen.swift
//  ExploreCity
//
//  Created by Isaac on 2024-02-08.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            Text("This is Home Screen")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("List of Activities")
            
            // Navigates to Activity details screen
            NavigationLink{
                ActivityDetailsScreen()
            }label: {
                Text("Go to ActivityDetails screen")
            }
            
            Spacer()
            
        } // VStack
        .padding()
        .navigationTitle("Home Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeScreen()
}
