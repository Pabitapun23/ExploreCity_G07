//
//  PurchasedTicketsList.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import Foundation

class PurchasedTicketsList: ObservableObject {
    
    // singleton instance
    static let purchasedTickets = PurchasedTicketsList(tickets: [])
        
    @Published var tickets: [Ticket]
        
    // Private initializer to prevent external instantiation
    private init(tickets: [Ticket]) {
        self.tickets = tickets
    }
    
}
