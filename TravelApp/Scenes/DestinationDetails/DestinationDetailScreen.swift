//
//  DestinationDetailScreen.swift
//  TravelApp
//
//  Created by Bakar Kharabadze on 5/29/24.
//

import SwiftUI

struct DestinationDetailScreen: View {
    let destination: TravelDestination
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if !destination.images.isEmpty {
                    AsyncImage(url: URL(string: destination.images[0])) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
                
                Text(destination.city)
                    .font(.title)
                    .padding(.top, 10)
                Text(destination.country)
                    .font(.headline)
                    .padding(.bottom, 5)
                Text(destination.description)
                    .font(.body)
                    .padding(.bottom, 10)
                
                HStack(spacing: 20) {
                    NavigationLink(value: destination.transport) {
                        Text("Transport")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(value: destination.mustSee) {
                        Text("Must See")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(value: destination.hotels) {
                        Text("Hotels")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }                }
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle(destination.city)
        .navigationDestination(for: [String].self) { transport in
            TransportScreen(transport: transport, navigationPath: $navigationPath)
        }
        .navigationDestination(for: [String].self) { mustSee in
            MustSeeScreen(mustSee: mustSee, navigationPath: $navigationPath)
        }
        .navigationDestination(for: [String].self) { hotels in
            HotelsScreen(hotels: hotels, navigationPath: $navigationPath)
        }
    }
}

 
