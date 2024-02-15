//
//  ImageView.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-14.
//

import SwiftUI

struct ImageView: View {
    let imageURL: URL
    
    var body: some View {
        // Load and display the image from the imageURL
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            case .empty:
                Image(systemName: "photo")
                
            case .failure(_):
                Image(systemName: "photo")
                
            @unknown default:
                Image(systemName: "photo")
            }
        }
        .navigationBarTitle("Image")
    }
}


#Preview {
    ImageView(imageURL: URL(string: "https://default.com/image.jpg")!)
}
