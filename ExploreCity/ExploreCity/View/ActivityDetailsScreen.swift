//
//  ActivityDetailsScreen.swift
//  ExploreCity
//
//  Created by Pabita on 2024-02-08.
//

import SwiftUI

struct ActivityDetailsScreen: View {
    
    @State private var isPresenting = false
    @State private var customerName: String = ""
    @State private var quantity: Int = 1
    @State private var price: Double = 10.00

    var activity: Activity
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Activity title
                Text(activity.name)
                    .font(.title2)
                    .fontWeight(.bold)
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
                
            
                HStack {
                    // Price
                    Text("Host name: \(activity.host)")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Share
                    Image(systemName: "arrowshape.turn.up.right")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                    
                    // Favourite
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundStyle(.red)
                    
                } // HStack
                
                // Description
                Text(activity.desc)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 10.0)
                
                // Price
                HStack {
                    Text("Price: ")
                        .fontWeight(.bold)
                        .padding(.bottom, 10.0)
                    
                    Text("$\(String(format: "%.2f", activity.pricePerPerson)) per person")
                        .padding(.bottom, 10.0)
                } // HStack
                
                // Contact
                HStack {
                    Text("Contact: ")
                        .fontWeight(.bold)
                        .padding(.bottom, 10.0)
                
                    Text(activity.contactNumber)
                        .padding(.bottom, 10.0)
                    
                    
                } // HStack
                  
                // Rating
                HStack {
                    ForEach(0..<5) {
                        _ in Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.yellow)
                    } // ForEach
                } // HStack
                
                // For ticket purchase
                HStack {
                    Spacer()
                    
                    // button
                    Button("BUY TICKET") {
                        isPresenting = true
                    }
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    
                    // To present a popover view, we can use Button to toggle a Boolean value
                    // .sheet presents a popover whenever a boolean value is set to true
                    .sheet(isPresented: $isPresenting, content: {
                        TicketPurchaseForm(customerName: $customerName, quantity: $quantity, price: $price)
                     })
                                       
                    Spacer()
                } // HStack
                .padding()
                
                
                Spacer()
                
            } // VStack
            .padding()
            .navigationTitle("ActivityDetails Screen")
            .navigationBarTitleDisplayMode(.inline)
            
            
        } // ScrollView
    } // body
    
}




#Preview {
    ActivityDetailsScreen(activity: DataManager.shared.cityList[0].activityList[0])
}
