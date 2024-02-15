//
//  PurchasedTicketsListScreen.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import SwiftUI

struct PurchasedTicketsListScreen: View {
    @EnvironmentObject var purchasedTickets: PurchasedTicketsList
    
    var body: some View {
//        NavigationView {
//
//            
//        } // NavigationView
        
        VStack {
            Text("Purchased Tickets List")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
            
            List {
                ForEach(purchasedTickets.tickets) { ticket in
                    NavigationLink(destination: TicketReceiptScreen(ticket: ticket)) {
                        HStack {
                            Text("\(ticket.activityName)")
                            Spacer()
                            Text("Confirmaion ID: \(ticket.confirmationNumber)")
                        }
                    }
                }
                .onDelete { indexSet in
                    purchasedTickets.tickets.remove(atOffsets: indexSet)
                }
            } // List
            
            Spacer()
            
        } // VStack
    } // body
}

#Preview {
    PurchasedTicketsListScreen()
}
