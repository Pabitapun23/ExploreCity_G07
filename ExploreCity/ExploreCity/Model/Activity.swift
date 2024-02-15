//
//  Activity.swift
//  ExploreCity
//
//  Created by Isaac Lee on 10/2/2024.
//

import Foundation

class Activity:Identifiable{
    var id: UUID = UUID()
    var name: String
    var desc: String
    var rating: Double
    var host: String
    var photo: URL?
    var pricePerPerson: Double
    var contactNumber: String
    
    init(name: String, desc: String, rating: Double, host: String, photo: URL?, pricePerPerson: Double, contactNumber: String) {
        self.name = name
        self.desc = desc
        self.rating = rating
        self.host = host
        self.photo = photo
        self.pricePerPerson = pricePerPerson
        self.contactNumber = contactNumber
    }
    
}
