//
//  TravelDestination.swift
//  TravelApp
//
//  Created by Bakar Kharabadze on 5/29/24.
//

import Foundation

struct TravelDestination: Decodable, Identifiable, Hashable {
    var id = UUID()
    let city: String
    let country: String
    let description: String
    let images: [String]
    let transport: [String]
    let mustSee: [String]
    let hotels: [String]
    
    enum CodingKeys: String, CodingKey {
        case city
        case country
        case description
        case images
        case transport
        case mustSee
        case hotels
    }
}

struct TravelData: Decodable {
    let travelDestinations: [TravelDestination]
    let travelTips: [String]
}
