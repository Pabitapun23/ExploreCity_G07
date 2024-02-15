//
//  RatingView.swift
//  ExploreCity
//
//  Created by Pabita Pun on 2024-02-14.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Double 
    var maximumRating: Double = 5.0
    var offImage: Image = Image(systemName: "star")
    var onImage: Image = Image(systemName: "star.fill")
    var halfImage: Image = Image(systemName: "star.leadinghalf.fill")
    var offColor: Color = Color.gray
    var onColor: Color = Color.yellow
 
    
    var body: some View {
        HStack {
            
            ForEach((1...Int(maximumRating)).map { Double($0) }, id: \.self) { number in
                self.getRating(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            } // ForEach
            
            
        } // HStack
    } // body
    
    // func to calculate ratings
    func getRating(for number: Double) -> Image {
        let remainder = rating - Double(number - 1)
        if remainder >= 0.75 {
            return onImage
        } else if remainder >= 0.25 {
            return halfImage
                
        } else {
            return offImage
        }
        
    }
        
}

#Preview {
    RatingView(rating: .constant(3.5))
}
