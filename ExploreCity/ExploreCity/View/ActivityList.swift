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
        }
    }
}

#Preview {
    ActivityList()
}
