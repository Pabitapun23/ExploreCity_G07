//
//  ActivityDetailsScreen.swift
//  ExploreCity
//
//  Created by Pabita on 2024-02-08.
//

import SwiftUI

struct ActivityDetailsScreen: View {
    
    @State private var isPresenting = false
    @State private var customerName: String = ""
    @State private var quantity: Int = 1
    @State private var price: Double = 10.00
    @State private var selectedImageURL: URL?
    @State private var isFavorite: Bool = false

    var activity: Activity
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Activity title
                Text(activity.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 10.0)
               
                // Images
                HStack {
                    Spacer()

                    if let photoURLs = activity.photo {
                        ForEach(photoURLs, id: \.self) { url in
                            // Load and display the photo from the URL
                            Button(action: {
                                // Set the selectedImageURL to the tapped image URL
                                selectedImageURL = url
                            }) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image) :
                                        image
                                            .resizable()
                                            .frame(width: 180, height: 300)
                                            .aspectRatio(contentMode: .fit)
                                        
                                    case .empty:
                                        Image(systemName: "building.2.crop.circle")
                                    case .failure(_):
                                        Image(systemName: "building.2.crop.circle")
                                    @unknown default:
                                        Image(systemName: "building.2.crop.circle")
                                    }
                                } // AsyncImage

                            }
                        } // ForEach
                    } // photoURLs
                    
                    
                    Spacer()
                    
                } // HStack
                
            
                HStack {
                    // Price
                    Text("Host name: \(activity.host)")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Share
                    // calling prepareShareableLink() func to share the datas
                    ShareLink(item: prepareShareableLink(), label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 25))
                            .foregroundStyle(.black)
                    }) // ShareLink
                    
                    
//                    // Favourite
//                    Image(systemName: "heart.fill")
//                        .resizable()
//                        .frame(width: 25.0, height: 25.0)
//                        .foregroundStyle(.red)
                    
                    // Favourite button
                    Button(action: {
                        isFavorite.toggle()
                        if isFavorite {
                        // Save the activity as a favorite
                        saveFavorite()
                        } else {
                        // Remove the activity from favorites
                        removeFavorite()
                        }
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(isFavorite ? .red : .black)
                    }
                    .padding()
                    Spacer()
                    
                } // HStack
                
                // Description
                Text(activity.desc)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 10.0)
                
                // Price
                HStack {
                    Text("Price: ")
                        .fontWeight(.bold)
                        .padding(.bottom, 10.0)
                    
                    Text("$\(String(format: "%.2f", activity.pricePerPerson)) per person")
                        .padding(.bottom, 10.0)
                } // HStack
                
                // Contact
                HStack {
                    Text("Contact: ")
                        .fontWeight(.bold)
                        .padding(.bottom, 10.0)
                    
                    // Contact Number - which is btn
                    // Button that opens phone app and prepopulate the contact number
                    // and user can also make a call
                    Button(action: {
                        // Handle tap gesture to open phone app
                        if let phoneURL = URL(string: "tel://\(activity.contactNumber)") {
                            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                        }
                     }){
                         Text(activity.contactNumber)
                     } // Button
                     .padding(.bottom, 10.0)
                    
                    
                } // HStack
                  
                // Rating
                HStack {
                    Text("Rating: ")
                        .fontWeight(.bold)
                        .padding(.bottom, 10.0)
                    RatingView(rating: .constant(activity.rating))
                        .padding(.bottom, 10.0)
                }
                
                // For ticket purchase
                HStack {
                    Spacer()
                    
                    // button
                    Button("BUY TICKET") {
                        isPresenting = true
                    }
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    
                    // To present a popover view, we can use Button to toggle a Boolean value
                    // .sheet presents a popover whenever a boolean value is set to true
                    .sheet(isPresented: $isPresenting, content: {
                        TicketPurchaseForm(customerName: $customerName, quantity: $quantity, price: $price)
                     })
                                       
                    Spacer()
                } // HStack
                .padding()
                
                
                Spacer()
                
            } // VStack
            .padding()
            .navigationTitle("ActivityDetails Screen")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // Check if the current activity is in the user's favorites
                guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
                    return
                }
                let favorites = UserDefaults.standard.stringArray(forKey: "\(loggedInUserEmail)_favorites") ?? []
                if favorites.contains(activity.name) {
                    isFavorite = true
                }
            }

            
        } // ScrollView
        .sheet(isPresented: Binding<Bool>(
            get: { selectedImageURL != nil },
            set: { isPresenting = $0 }
         )) {
             if let url = selectedImageURL {
                 ImageView(imageURL: url)
                     .onDisappear {
                         selectedImageURL = nil
                     }
             } // if   
         } // .sheet
                    
    } // body
    
    // Function to prepare shareable link
    private func prepareShareableLink() -> String {
        // shareable data includes activity name and price per person
        let shareableData = "\(activity.name): $\(activity.pricePerPerson) per person"
        return shareableData
    } // func
    
    func saveFavorite() {
        guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
            return
        }
        // Save the activity name as a favorite for the logged-in user
        var favorites = UserDefaults.standard.stringArray(forKey: "\(loggedInUserEmail)_favorites") ?? []
        if !favorites.contains(activity.name) {
            favorites.append(activity.name)
            UserDefaults.standard.set(favorites, forKey: "\(loggedInUserEmail)_favorites")
        }
    } // func

    func removeFavorite() {
        guard let loggedInUserEmail = UserDefaults.standard.string(forKey: "LoggedInUserEmail") else {
            return
        }
        // Remove the activity name from favorites for the logged-in user
        var favorites = UserDefaults.standard.stringArray(forKey: "\(loggedInUserEmail)_favorites") ?? []
        if let index = favorites.firstIndex(of: activity.name) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: "\(loggedInUserEmail)_favorites")
        }
    } // func
    
}




#Preview {
    ActivityDetailsScreen(activity: DataManager.shared.cityList[0].activityList[0])
    
}
