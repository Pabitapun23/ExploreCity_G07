//
//  TicketPurchaseForm.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-14.
//

import SwiftUI

struct TicketPurchaseForm: View {
    @Binding var customerName: String
    @Binding var quantity: Int
    @Binding var price: Double
    
    var body: some View {
        VStack() {
            Text("Ticket Purchase Form")
                .font(.title)
                .fontWeight(.semibold)
            
            // Form
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("Activity name:")
                        .fontWeight(.bold)
                    Text("Activity 1")
                }
                
                Text("Customer Name:")
                    .fontWeight(.bold)
                TextField("Enter your name", text: $customerName)
                    .textFieldStyle(.roundedBorder)
                
                HStack {
                    Text("Quantity")
                        .fontWeight(.bold)
                    Spacer()
                    Stepper("\(quantity)", value: $quantity, in: 1...100)
                    
                } // HStack
                
                HStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    Text("$10.00")
                } // HStack
                
                HStack {
                    Spacer()
                    
                    Button {
//                        NavigationLink(destination: ReceiptScreen(), label: "Next")
                    } label: {
                        Text("Buy Ticket")
                    } // button
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                } // HStack
                
            } //VStack
            .padding()
            
            Spacer()
            
        } // VStack
        .padding()
    } // body
}

#Preview {
    TicketPurchaseForm(customerName: .constant("John Doe"), quantity: .constant(1), price: .constant(10.00))
}
