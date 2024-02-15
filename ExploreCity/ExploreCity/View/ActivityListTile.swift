//
//  ActivityListTile.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-14.
//

import SwiftUI

struct ActivityListTile: View {
    var activity: Activity
    
    var body: some View {
        HStack(alignment: .top){
            if let imageURL = activity.photo {
                if let imageURL = activity.photo?.first { // Select the first image from the array
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
        } // HStack
        .padding(.vertical, 5.0)

    } // body
}

#Preview {
    ActivityListTile(activity: Activity(name: "test", desc: "test", rating: 1.0, host: "test", photo: nil, pricePerPerson: 1.00, contactNumber: "123"))
}
