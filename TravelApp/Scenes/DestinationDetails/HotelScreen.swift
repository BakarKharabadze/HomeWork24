//
//  HotelScreen.swift
//  TravelApp
//
//  Created by Bakar Kharabadze on 5/30/24.
//

import SwiftUI

struct HotelsScreen: View {
    let hotels: [String]
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack(spacing: 10) {
            List(hotels, id: \.self) { item in
                Text(item)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(.white)
                    .cornerRadius(8)
            }
            .navigationTitle("Hotels")
            .listStyle(PlainListStyle())
            
            Button(action: {
                navigationPath = NavigationPath()
            }) {
                Text("Go to main screen")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
        }
    }
}


