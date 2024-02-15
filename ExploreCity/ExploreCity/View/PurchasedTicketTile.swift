//
//  PurchasedTicketTile.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import SwiftUI

struct PurchasedTicketTile: View {
    var ticket: Ticket
    
    var body: some View {
        HStack(alignment: .top) {
            if let imageURL = ticket.activityImage?.first { // Select the first image from the array
                AsyncImage(url: imageURL){ phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    default:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }else{
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading){
                Text("\(ticket.activityName)")
                    .font(.headline)
                    .foregroundColor(Color.green)
                
                HStack {
                    Text("Confirmaiton ID:")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(ticket.confirmationNumber)
                }
            }
        } // HStack
    }
}

#Preview {
    PurchasedTicketTile(ticket: Ticket(customerName: "test", quantity: 1, activityName: "test", totalPrice: 0.00, activityImage: nil, userEmail: ""))
}
