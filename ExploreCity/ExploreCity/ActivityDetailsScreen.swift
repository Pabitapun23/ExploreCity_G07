//
//  ActivityDetailsScreen.swift
//  ExploreCity
//
//  Created by Pabita on 2024-02-08.
//

import SwiftUI

struct ActivityDetailsScreen: View {
    var body: some View {
        
        VStack {
            Text("Activity Details Screen")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
        } // VStack
        .padding()
        .navigationTitle("ActivityDetails Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ActivityDetailsScreen()
}
