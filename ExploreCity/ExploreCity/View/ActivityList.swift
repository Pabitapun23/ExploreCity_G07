//
//  ActivityList.swift
//  ExploreCity
//
//  Created by Isaac Lee on 10/2/2024.
//

import SwiftUI

struct ActivityList: View {
    var cityList = DataManager.shared.cityList
    @State private var searchText: String = ""
    
    @State private var selectOption = -1
    let cityOptions:[String] = DataManager.shared.cityList.map { $0.name }
    
    var body: some View {
        NavigationStack{
            
            // Filter City
            Picker("Select a city", selection: $selectOption) {
                Text("All City").tag(-1)
                ForEach(0..<self.cityOptions.count){
                    Text("\(cityOptions[$0])")
                }
            }
            
            List{
                ForEach(searchCity(searchTerm: searchText)){ city in
                    Section("Activity in \(city.name)"){
                        ForEach(searchActivity(searchTerm: searchText, searchCity: city)){ activity in
                            NavigationLink(destination: ActivityDetailsScreen(activity: activity)){
                                HStack(alignment: .top){
                                    if let imageURL = activity.photo {
                                        AsyncImage(url: imageURL){ phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .clipShape(
                                                        RoundedRectangle(cornerRadius: 10)
                                                    )
                                            default:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 100, height: 100)
                                            }
                                        }
                                    }else{
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                    }
                                    VStack(alignment: .leading){
                                        Text("\(activity.name)")
                                            .font(.headline)
                                        Text("$\(String(format: "%.2f", activity.pricePerPerson)) / person")
                                            .font(.subheadline)
                                    }
                                }
                                .padding(.vertical, 5.0)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Activity List")
            .searchable(text: $searchText, prompt: "Search by activity name")
        }
    }
    
    // Check whether the city contains that activity
    private func searchCity(searchTerm: String) -> [City]{
        if selectOption != -1 {
            // A City is select
            var resultCity: [City] = []
            for city in self.cityList{
                if city.name.contains(cityOptions[selectOption]){
                    resultCity.append(city)
                }
            }
            return resultCity
        }
        
        
        if(searchTerm.isEmpty){
            return cityList
        }else{
            var resultCity: [City] = []
            for city in self.cityList{
                for activity in city.activityList {
                    if( activity.name.contains(searchTerm)){
                        resultCity.append(city)
                        break
                    }
                }
            }
            return resultCity
        }
    }
    
    // Search activity within the given city
    private func searchActivity(searchTerm: String, searchCity: City) -> [Activity]{
        if(searchTerm.isEmpty){
            return searchCity.activityList
        }else{
            var resultActivity: [Activity] = []
            for activity in searchCity.activityList {
                if activity.name.contains(searchTerm){
                    resultActivity.append(activity)
                }
            }
            return resultActivity
        }
    }
        
}

#Preview {
    ActivityList()
}
