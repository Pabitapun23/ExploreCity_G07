//
//  Ticket.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import Foundation

class Ticket: Identifiable {
    var customerName: String
    var quantity: Int
    var activityName: String
    var totalPrice: Double
    
    // computed property for confirmation number
    var confirmationNumber: String {
        // calling func that generates bookingNumber of 5 characters long
        return ("\(generateConfirmationNumber(5))")
    }
    
    // function to generate bookingNumber from random alphabets and Numbers
    func generateConfirmationNumber(_ length: Int) -> String {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
       let randomString = (0..<length).map{ _ in String(letters.randomElement()!) }.reduce("", +)
       return randomString
    }
    
    init(customerName: String, quantity: Int, activityName: String, totalPrice: Double) {
        self.customerName = customerName
        self.quantity = quantity
        self.activityName = activityName
        self.totalPrice = totalPrice
    }
}
