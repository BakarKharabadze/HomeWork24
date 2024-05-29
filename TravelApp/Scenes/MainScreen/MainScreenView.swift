//
//  MainScreenView.swift
//  TravelApp
//
//  Created by Bakar Kharabadze on 5/29/24.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject private var viewModel = MainScreenViewModel()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                List(viewModel.travelDestinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.city)
                                .font(.headline)
                            Text(destination.country)
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Travel Destinations")
                .onAppear {
                    viewModel.fetchTravelData()
                }
                .navigationDestination(for: TravelDestination.self) { destination in
                    DestinationDetailScreen(destination: destination, navigationPath: $navigationPath)
                }
                
                Button(action: {
                    viewModel.getRandomTravelTip()
                }) {
                    Text("Travel Tips")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showTravelTip) {
                Alert(
                    title: Text("Travel Tip"),
                    message: Text(viewModel.travelTip),
                    dismissButton: .default(Text("OK")) {
                        viewModel.showTravelTip = false
                    }
                )
            }
        }
    }
}

#Preview {
    MainScreenView()
}
