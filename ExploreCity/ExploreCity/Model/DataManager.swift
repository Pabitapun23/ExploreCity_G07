//
//  DataManager.swift
//  ExploreCity
//
//  Created by Isaac Lee on 10/2/2024.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var cityList: [City]
    
    private init(){
        cityList = [
            City(name: "New York", activityList: [
                Activity(name: "Activity 1", desc: "Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.", star: 5.0, host: "Isaac", photo: "https://upload.wikimedia.org/wikipedia/commons/8/84/New_York_City_skyline.jpg", pricePerPerson: 10.0),
                Activity(name: "Activity 2", desc: "Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.", star: 5.0, host: "Isaac", photo: "https://upload.wikimedia.org/wikipedia/commons/8/84/New_York_City_skyline.jpg", pricePerPerson: 20.0),
                Activity(name: "Activity 3", desc: "Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.", star: 5.0, host: "Isaac", photo: "https://upload.wikimedia.org/wikipedia/commons/8/84/New_York_City_skyline.jpg", pricePerPerson: 30.0)
            ]),
            City(name: "Hong Kong", activityList: [
                Activity(name: "Activity 4", desc: "Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.", star: 5.0, host: "Isaac", photo: "https://upload.wikimedia.org/wikipedia/commons/8/84/New_York_City_skyline.jpg", pricePerPerson: 40.0),
                Activity(name: "Activity 5", desc: "Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.", star: 5.0, host: "Isaac", photo: "https://upload.wikimedia.org/wikipedia/commons/8/84/New_York_City_skyline.jpg", pricePerPerson: 50.0),
                Activity(name: "Activity 6", desc: "Anim officia cillum magna consectetur cillum. Eu quis est exercitation officia cupidatat proident elit pariatur magna nisi consequat ea et sunt. Aliqua do consequat excepteur magna. Occaecat minim tempor dolore consectetur esse fugiat ut in Lorem dolor commodo. Tempor ipsum commodo excepteur qui irure Lorem enim duis commodo.", star: 5.0, host: "Isaac", photo: "https://upload.wikimedia.org/wikipedia/commons/8/84/New_York_City_skyline.jpg", pricePerPerson: 60.0)
            ])
        ]
    }
}
