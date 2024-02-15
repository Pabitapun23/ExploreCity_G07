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
    @Binding var totalPrice: Double
    @Binding var errMsg: String
    @Binding var confirmMsg: String
    
    
    var activity: Activity
    
    // reservation list
    @EnvironmentObject var ticketsPurchasedList: PurchasedTicketsList
    
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
                    Text(activity.name)
                }
                
                Text("Customer Name:")
                    .fontWeight(.bold)
                TextField("Enter your name", text: $customerName)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                
                HStack {
                    Text("Quantity")
                        .fontWeight(.bold)
                    Spacer()
                    Stepper("\(quantity)", value: $quantity, in: 1...100)
                    
                } // HStack
                
                HStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    
                    Text("$\(Double(quantity) * (activity.pricePerPerson), specifier: "%.2f")")
               
                    
                } // HStack
                
                Text(errMsg)
                    .foregroundStyle(.red)
                
                Text(confirmMsg)
                    .foregroundStyle(.green)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                        // call function to purchase ticket
                        buyTicket()
                        
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
    
    
    // function to purchase ticket
    
    func buyTicket() {

          
        // form validation
        if(customerName.isEmpty) {
            errMsg = "ERROR - customer name must be provided"
            confirmMsg = ""
            return
        } else {
            errMsg = ""
            print("Ticket purchased successfully.")
        }
 
        totalPrice = Double(quantity) * activity.pricePerPerson
        
        // add to ticketPurchasedList
        let newTicket = Ticket(customerName: customerName, quantity: quantity, activityName: activity.name, totalPrice: totalPrice)
        
        ticketsPurchasedList.tickets.append(newTicket)
        
        confirmMsg = "Ticket purchased successfully."
      
        // reset fields
        customerName = ""
        quantity = 1
        totalPrice = 1 * activity.pricePerPerson
        
    }
}

#Preview {
    TicketPurchaseForm(customerName: .constant("John Doe"), quantity: .constant(1), totalPrice: .constant(10.00), errMsg: .constant(""), confirmMsg: .constant(""), activity: Activity(name: "Example Activity", desc: "Description", rating: 4.5, host: "Host", photo: nil, pricePerPerson: 20.0, contactNumber: "1234567890"))
}
