//
//  FavoriteList.swift
//  Project
//
//  Created by Tech on 2024-02-12.
//

import SwiftUI

struct FavoriteList: View {
    @State private var favorites: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if favorites.isEmpty {
                    Text("No favorites saved")
                } else {
                    Button(action: {removeAllFavorite()}, label: {
                        Text("Remove All")
                    })
                    List {
                        ForEach(favorites, id: \.self) { activityName in
                            NavigationLink(destination: ActivityDetailsScreen(activity: getActivityByName(activityName))) {
                                Text(activityName)
                            }
                        }
                        .onDelete(perform: deleteFavorite)
                    }
                }
            }
            .navigationBarTitle(Text("Favorite List"))
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom, 20)
            .onAppear {
                // Retrieve saved favorites from UserDefaults
                guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
                    return
                }
                favorites = UserDefaults.standard.stringArray(forKey: "\(loggedInUserEmail)_favorites") ?? []
            }
        }
    }
    
    private func removeAllFavorite(){
        guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
            return
        }
        favorites = []
        UserDefaults.standard.set(favorites, forKey: "\(loggedInUserEmail)_favorites")
        
    }
    
    private func getActivityByName(_ name: String) -> Activity {
        // Search for the activity in the DataManager's cityList
        for city in DataManager.shared.cityList {
            if let activity = city.activityList.first(where: { $0.name == name }) {
                return activity
            }
        }
        // Return a dummy activity if not found
        return Activity(name: "", desc: "", rating: 0, host: "", photo: nil, pricePerPerson: 0, contactNumber: "")
    }
    
    private func deleteFavorite(at offsets: IndexSet) {
        guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
            return
        }
        favorites.remove(atOffsets: offsets)
        UserDefaults.standard.set(favorites, forKey: "\(loggedInUserEmail)_favorites")
    }
}

#Preview {
    FavoriteList()
}
