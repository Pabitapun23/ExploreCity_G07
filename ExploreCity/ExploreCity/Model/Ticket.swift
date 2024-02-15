//
//  Ticket.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-15.
//

import Foundation

class Ticket: Identifiable, Codable{
    var customerName: String
    var quantity: Int
    var activityName: String
    var totalPrice: Double
    var activityImage: [URL]?
    var userEmail: String
    
    // property for confirmation number
    var confirmationNumber: String
    
    // function to generate bookingNumber from random alphabets and Numbers
    static func generateConfirmationNumber(_ length: Int) -> String {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
       let randomString = (0..<length).map{ _ in String(letters.randomElement()!) }.reduce("", +)
       return randomString
    }
    
    init(customerName: String, quantity: Int, activityName: String, totalPrice: Double, activityImage: [URL]? = nil, userEmail: String) {
        self.customerName = customerName
        self.quantity = quantity
        self.activityName = activityName
        self.totalPrice = totalPrice
        self.activityImage = activityImage
        self.userEmail = userEmail
        self.confirmationNumber = Ticket.generateConfirmationNumber(5)
    }
}
