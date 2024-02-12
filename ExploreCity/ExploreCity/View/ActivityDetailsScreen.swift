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
//            Text("Activity Details Screen")
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            // Activity title
            Text("Sunset Canoe Tour of the Waterfront")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 10.0)
            
            
            VStack(alignment: .leading) {
                // Price
                Text("Price: $52 per person")
                    .font(.headline)
                    .padding(.bottom, 10.0)
                
                // Images
                HStack {
                    Image("canoe1")
                        .resizable()
                        .frame(width: 180, height: 300)
                    
                    Image("canoe2")
                        .resizable()
                        .frame(width: 180, height: 300)
                } // HStack
                
                // Description
                Text("Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 10.0)
                
                // Rating
                HStack {
                    ForEach(0..<5) {
                        _ in Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.yellow)
                    } // ForEach
                } // HStack
                
                // Contact
                Text("555-555-5555")
                    .padding(.vertical, 10.0)
                    
                
            } // VStack
            
            // Share and Favourite
            HStack {
                Spacer()
                Image(systemName: "arrowshape.turn.up.right")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundStyle(.red)
                
            } // HStack
    
            
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
