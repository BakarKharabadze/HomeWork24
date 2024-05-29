//
//  TransportScreen.swift
//  TravelApp
//
//  Created by Bakar Kharabadze on 5/30/24.
//

import SwiftUI

struct TransportScreen: View {
    let transport: [String]
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack(spacing: 10) {
            List(transport, id: \.self) { item in
                Text(item)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(.white)
                    .cornerRadius(8)
            }
            .navigationTitle("Transport")
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

