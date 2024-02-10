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
    var star: Double
    var host: String
    var photo: String
    var pricePerPerson: Double
    
    init(name: String, desc: String, star: Double, host: String, photo: String, pricePerPerson: Double) {
        self.name = name
        self.desc = desc
        self.star = star
        self.host = host
        self.photo = photo
        self.pricePerPerson = pricePerPerson
    }
}
