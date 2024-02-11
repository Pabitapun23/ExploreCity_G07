//
//  ContentView.swift
//  ExploreCity
//
//  Created by Vaishnavi on 2024-02-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("This is Login Screen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                NavigationLink {
//                    HomeScreen()
                    ActivityList()
                } label: {
//                    Text("HomeScreen")
                    Text("ActivityList Screen")
                } // NavigationLink
                
                Spacer()
                
            } // VStack
            .padding()
            .navigationTitle("Login Screen")
            
        } // NavigationStack
    }
}

#Preview {
    ContentView()
}
