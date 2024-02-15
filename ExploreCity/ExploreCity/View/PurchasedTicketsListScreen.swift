//
//  PurchasedTicketsListScreen.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import SwiftUI

struct PurchasedTicketsListScreen: View {
  
    @State private var purchasedTickets: [Ticket] = []
    
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {

                List {
                    ForEach(purchasedTickets) { ticket in
                        NavigationLink(destination: TicketReceiptScreen(ticket: ticket)) {
                            PurchasedTicketTile(ticket: ticket)
                        }
                    }
                    .onDelete(perform: deleteTicket)
                } // List
                
                Spacer()
                
            }
            .padding(.top, 20.0) // VStack
            .navigationBarHidden(true)
            .onAppear {
                // Retrieve saved favorites from UserDefaults
                guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
                    return
                }
                
                // Retrieve tickets from UserDefaults
                if let ticketsData = UserDefaults.standard.data(forKey: "purchasedTickets_\(loggedInUserEmail)") {
                            let decoder = JSONDecoder()
                            if let savedTickets = try? decoder.decode([Ticket].self, from: ticketsData) {
                                purchasedTickets = savedTickets
                            }
                        }
            }
            
            
            
        } // NavigationView
        .navigationTitle("Purchased Tickets List")
        
        Spacer()
    } // body
    
    func deleteTicket(at offsets: IndexSet) {
            purchasedTickets.remove(atOffsets: offsets)
            saveTickets()
        }

    func saveTickets() {
        guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
            return
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(purchasedTickets) {
            UserDefaults.standard.set(encoded, forKey: "purchasedTickets_\(loggedInUserEmail)")
        }
    }
}

#Preview {
    PurchasedTicketsListScreen()
}
