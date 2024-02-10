//
//  City.swift
//  ExploreCity
//
//  Created by Isaac Lee on 10/2/2024.
//

import Foundation

struct City: Identifiable{
    var id: UUID = UUID()
    var name: String
    var activityList: [Activity]
}
