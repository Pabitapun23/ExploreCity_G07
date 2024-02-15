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
                    Spacer()
                    Image("canoe1")
                        .resizable()
                        .frame(width: 180, height: 300)
                    
                    Image("canoe2")
                        .resizable()
                        .frame(width: 180, height: 300)
                    Spacer()
                    
                } // HStack
                
            
                HStack {
                    // Price
                    Text("Host name: \(activity.host)")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Share
                    // calling prepareShareableLink() func to share the datas
                    ShareLink(item: prepareShareableLink(), label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 25))
                            .foregroundStyle(.black)
                    }) // ShareLink
                    
                    
                    // Favourite
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
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
                    
                    // Contact Number - which is btn
                    // Button that opens phone app and prepopulate the contact number
                    // and user can also make a call
                    Button(action: {
                        // Handle tap gesture to open phone app
                        if let phoneURL = URL(string: "tel://\(activity.contactNumber)") {
                            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                        }
                     }){
                         Text(activity.contactNumber)
                     } // Button
                     .padding(.bottom, 10.0)
                    
                    
                } // HStack
                  
                // Rating
                RatingView(rating: .constant(activity.rating))
                
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
    
    // Function to prepare shareable link
    private func prepareShareableLink() -> String {
        // shareable data includes activity name and price per person
        let shareableData = "\(activity.name): $\(activity.pricePerPerson) per person"
        return shareableData
    }
    
}




#Preview {
    ActivityDetailsScreen(activity: DataManager.shared.cityList[0].activityList[0])
    
}
