//
//  ContentView.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("This is Login Screen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                NavigationLink {
                    HomeScreen()
                } label: {
                    Text("HomeScreen")
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
