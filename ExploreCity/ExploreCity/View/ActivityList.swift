//
//  ActivityList.swift
//  ExploreCity
//
//  Created by Isaac Lee on 10/2/2024.
//

import SwiftUI

struct ActivityList: View {
    var cityList = DataManager.shared.cityList
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(cityList){ city in
                    Section("Activity in \(city.name)"){
                        ForEach(city.activityList){ activity in
                            NavigationLink(destination: ActivityDetailsScreen()){
                                HStack(alignment: .top){
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    VStack(alignment: .leading){
                                        Text("\(activity.name)")
                                            .font(.headline)
                                        Text("$\(String(format: "%.2f", activity.pricePerPerson)) / person")
                                            .font(.subheadline)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Activity")
        }
    }
}

#Preview {
    ActivityList()
}
