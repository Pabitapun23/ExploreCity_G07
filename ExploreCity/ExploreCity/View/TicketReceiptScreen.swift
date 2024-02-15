//
//  TicketReceiptScreen.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import SwiftUI

struct TicketReceiptScreen: View {
    var ticket: Ticket
    
    var body: some View {
        VStack {
            Text("Ticket Receipt")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10.0)
            
            Grid(alignment: .leading, verticalSpacing: 10) {
                GridRow {
                    Text("Customer Name:")
                        .fontWeight(.bold)
                        
                    Text("\(ticket.customerName)")
                }
                GridRow {
                    Text("Activity Name:")
                        .fontWeight(.bold)
                    Text("\(ticket.activityName)")
                }
                GridRow {
                    Text("Total Price:")
                        .fontWeight(.bold)
                    Text("$\(ticket.totalPrice, specifier: "%.2f")")
                }
                GridRow {
                    Text("Ticket Confirmation Number:")
                        .fontWeight(.bold)
                    Text("\(ticket.confirmationNumber)")
                }
                
                Spacer()
            } // Grid
        } // VStack
    }
}

#Preview {
    TicketReceiptScreen(ticket: Ticket(customerName: "user", quantity: 1, activityName: "test", totalPrice: 0.00, userEmail: ""))
}
