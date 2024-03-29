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
                    City(name: "Toronto", activityList: [
                        Activity(name: "Create your own custom silver ring", 
                                 desc: "Using real sterling silver, tiny saws, hammers, and fire, you'll create your very own ring. I'll teach you how to measure, cut, solder, bend, file, and polish your custom creation. You can also texturize or letter stamp it to make it truly one of a kind. You'll leave wearing your new ring with a sense of great accomplishment and the perfect souvenir.\n\nOther things to note:\nThis experience runs between 2.5-3.5 hours long depending on your design choices and work ethic. Average class time is 3 hours.\nSafety is important in the studio! Please wear closed-toed shoes and avoid wearing long or flowing clothing. Bring eyeglasses if you need them.",
                                 rating: 5.0,
                                 host: "Danielle",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-68755-media_library/original/0f1c6e81-3ec3-4a64-a8ba-64e4b8814cd4.jpeg?im_w=320")!, 
                                         URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-68755-media_library/original/60275656-9a54-46c2-901d-6b44ee99204b.jpeg?im_w=1440")!], pricePerPerson: 198.0, contactNumber: "+1(416)123-4567"),
                        
                        Activity(name: "Show Me The City - Toronto Walking Tour",
                                 desc: "About the tour:\nOn our 3-hour small group walking tour of Toronto you will see and learn about city's diversity, history and future. You will also see landmarks such as Harbourfront, Brookfield Place & The Entertainment District.\nThe walk ends at the St. Lawrence Market, considered one the world's great food markets, so bring an appetite.\n\nThe tour does go into Toronto's PATH an above and below ground labyrinth used by thousands of people daily.\n\nBring your camera, your walking shoes and your questions!", rating: 4.95, host: "Dave",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/d1e179d3-36b1-4952-a1ac-cec3388585e9.jpg?im_w=320")!,
                                         URL(string: "https://a0.muscache.com/im/pictures/94458bdc-59e2-468c-ae23-7a4165b91357.jpg?im_w=720")!
                                        ], pricePerPerson: 48.0,
                                 contactNumber: "+1(416)111-2222"),
                        
                        Activity(name: "Secret Food Tours Toronto", 
                                 desc: "Our journey starts at the St. Lawrence Market, Toronto’s historic marketplace dating back over 200 years.\n\nFirst up, we’ll visit a local fish market where you’ll sample wild-caught sockeye salmon cured in Canadian maple syrup.\n\nThen we'll visit a pub known for making one of the best versions of the \"peameal bacon sandwich\", also known as Canadian bacon.\n\nNext, you'll indulge in a popular no-bake dessert whose origin is shrouded in mystery.\n\nAfter leaving the market, you'll unearth an Indian-inspired dish that has taken Toronto by surprise and is now a staple of the city's street food scene.\n\nAnd for a great end, you'll devour the mouth-watering goodness of a classic Canadian pastry, the famous Butter Tart.\n\nAs with all our tours, there is also our delicious Secret Dish.",
                                 rating: 4.6, 
                                 host: "Nico",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-4255855-media_library/original/153bc39b-4b6e-4b66-873b-c91396b2d137.jpeg?im_w=320")!, 
                                         URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-4510709-media_library/original/1242cf13-56c5-4586-9db9-6cf2b5534262.jpeg?im_w=720")!],
                                 pricePerPerson: 79.0,
                                 contactNumber: "+1(416)135-2468")
                    ]),
                    City(name: "Los Angeles", activityList: [
                        Activity(name: "The History and Architecture of Downtown Los Angeles", 
                                 desc: "Welcome to DTLA! This 3hr walking tour is the best way to explore the most historic part of Los Angeles.\n\nIf you want to truly understand LA, you have to visit downtown. Downtown is the birthplace of Los Angeles; where LA began with just 44 people and eventually grew into the city we see today. The history of LA and downtown are inseparable. On this tour, you will experience several different parts of DTLA.\n\nWe begin the tour with an architectural deep dive into the historic core. This is where you'll learn about some of the most incredible buildings in LA. This section includes The Bradbury Building, Pershing Sq, the Last Bookstore, and so much more!\n\nFrom there, you'll head to Little Tokyo. Full of shops and restaurants, Little Tokyo is one of the coolest parts of LA. Here, you will get a break to do a little shopping or grab a boba tea. You will also get a treat from the oldest confectionery in LA! Mochi lovers won't want to miss this!\n\nThe final third will take you through the Civic Center, Grand Park, and the Music Center. This is the political engine that keeps LA going. You'll see incredible film locations here like City Hall and The Walt Disney Concert Hall, which have appeared in Batman and Iron Man! Finally, you'll board Angels Flight and ride the 120+ year old funicular down to where we began!",
                                 rating: 5.0,
                                 host: "Christopher",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-3577382-media_library/original/307f98cc-bff4-45d2-8c0c-d4d4a903cbd4.jpeg?im_w=320")!, 
                                         URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-3577382-media_library/original/1997a1be-fb06-42c8-8f7d-66fe48bdd5bd.jpeg?im_w=720")!],
                                 pricePerPerson: 68.0,
                                 contactNumber: "+1(135)246-8024"),
                        
                        Activity(name: "L.A. Highlights in One Day!", 
                                 desc: "Get ready for a whirlwind adventure through LA with our 'LA Highlights in One Day' experience!\n\nCan't find the perfect date? Just drop us a message with your preferred day and crew size – we'll make it happen!\n\nShort on time? No worries! Our tour is tailor-made to show you the best of LA, whether you're a newbie or a seasoned local. As proud Angelinos, we're here to share insider tips and tricks to make your visit unforgettable.\n\nWe'll kick off in Downtown LA, then cruise to Santa Monica Beach, hitting all the must-see spots in between! From Grand Central Market to the iconic Hollywood Sign, we've got your itinerary covered.\n\nHighlights include:\n\nGriffith Observatory\nHollywood Walk of Fame\nBeverly Hills\nVenice Beach\nSanta Monica\nAnd more!\nHop on board our ride and let the adventure begin! Please leave your furry friends at home, and while tips are never expected, they're always appreciated.\n\nJoin us for a day of laughter, exploration, and memories to last a lifetime! Book now and let's make it a day to remember!",
                                 rating: 4.97,
                                 host: "Natalie Javier And Friends",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-252081-media_library/original/ed2c06df-2235-48d1-a7bd-fe14c3b50612.jpeg?im_w=320")!, 
                                         URL(string: "https://a0.muscache.com/im/pictures/fe85369c-0d80-4951-8c2c-398a38dde064.jpg?im_w=720")!],
                                 pricePerPerson: 188,
                                 contactNumber: "+1(135)214-2024"),
                        Activity(name: "Nice Los Angeles Full Day City Tour", 
                                 desc: "Explore highlighted locations in Los Angeles!\n\nVisit the all-time famous Hollywood Walk-of-Fame!\n\nEnjoy delicious dishes at the Original Farmers Market.\n\nExperience the artifacts and sculptures at the Getty Center.\n\nShop at famous designer brands on Rodeo Drive.\n\nLet’s leave in the early morning to visit the birthplace of Los Angeles at Olvera Street! Following we will visit the world-famous Hollywood walk of fame. Shortly after, is Rodeo Drive and Beverly center to go shopping in paradise. Finally, we will visit the landmark the Getty Center!\n\nItinerary:\n\nOlvera Street (30 mins) → Hollywood Walk-of-Fame (60 mins) → Rodeo Drive (45 mins) → The Original Farmers Market (70 mins) → Getty Center (120 mins)",
                                 rating: 5.0,
                                 host: "Rui",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-3584843-media_library/original/8d825dc5-5e9d-41cf-acec-1ff1124e0ece.jpeg?im_w=320")!,
                                         URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-3584843-media_library/original/cdbf5a93-f45d-40d8-ac0f-1bb8aebaf1a9.jpeg?im_w=720")!],
                                 pricePerPerson: 130.0,
                                 contactNumber: "+1(135)214-1357"),
                        
                        Activity(name: "Arts District LA-If these walls could talk", desc: "In this neighborhood walking tour, participants will explore the Los Angeles Arts District known for its street art, and learn about the artists behind the murals through their personal stories and experiences. The tour would first include stops at several notable murals, with the guide providing background information on the artist and the inspiration behind the piece.\nIn this themed walking tour, participants will explore a specific theme that runs through many of the murals in a particular area.\nThe themes range from social justice to street politics and rules. The tour would include stops at several murals that reflect these themes, Often murals are sometimes vandalized or destroyed for many reasons and some remain unaffected.\nThe guide would provide background information on the artists and their personal stories and experiences.\nThe guide is a local artist from a well known worldwide known graffiti crew and has various city sponsored public art projects that can be viewed in person everyday. But it’s the guides access to the the inner workings of the underground street art culture that stand s him apart from all other street art tours in LA.", rating: 1.5, 
                            host: "Joseph",
                            photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-4848266-media_library/original/c2cf0dda-03ef-4d8c-952e-feb7cc1e2b50.jpeg?im_w=320")!,
                                    URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-1082605-media_library/original/016f4ec4-da26-492a-845c-995373817c35.jpeg?im_w=720")!],
                            pricePerPerson: 109.0,
                            contactNumber: "+1(135)214-1324"),
                        
                        Activity(name: "DTLA Murder Mystery Ghost Tour", 
                                 desc: "On our DTLA Murder Mystery Ghost tour we go on a noir investigation of LA & enjoy cocktails in a couple of haunted bars. First we visit the Biltmore Hotel, the last place the Black Dahlia was seen alive. Next we stop at Clifton’s & learn about the anti-corruption drive of its Christian founder (who had a few secrets himself). After that we move to the Hotel Cecil, which has a hellish history of murders, suicides & killers (including the Night Stalker). From there the DTLA Murder Mystery Ghost tour moves to the once grand Alexandria Hotel, where Rudolph Valentino’s ghost still haunts his old penthouse, then the Barclay Hotel, home to 2 serial killers & scene of some of their most brutal murders. We visit the site of the Chinatown Massacre before the tour finishes at the Halls of Justice, site of many dramatic trials, including those of “Bugsy” Siegel & Charles Manson. Join our DTLA Murder Mystery Ghost tour & have sleepless nights for weeks!",
                                 rating: 4.82,
                                 host: "Damien",
                                 photo: [URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-1088887-media_library/original/04cf3ecd-5c40-4a75-ba24-5c6f2ecae50e.jpeg?im_w=320")!,
                                         URL(string: "https://a0.muscache.com/im/pictures/lombard/MtTemplate-1088887-media_library/original/c2c9e701-e242-47c0-bb88-615c044241d5.jpeg?im_w=320")!],
                                 pricePerPerson: 75.0,
                                 contactNumber: "+1(416)123-4569")
                    ])
        ]
        
    
    }
}
