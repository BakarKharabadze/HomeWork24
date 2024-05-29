//
//  MainScreenViewModel.swift
//  TravelApp
//
//  Created by Bakar Kharabadze on 5/29/24.
//

import Foundation
import Combine
import Networking

final class MainScreenViewModel: ObservableObject {
    @Published var travelDestinations: [TravelDestination] = []
    @Published var travelData: TravelData?
    @Published var showTravelTip = false
    @Published var travelTip = ""
    
    func fetchTravelData() {
        let urlString = "https://mocki.io/v1/48d927d7-2399-4bfa-a8ff-9a602607e0d0"
        NetworkManager.shared.request(url: urlString) { (result: Result<TravelData, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let travelData):
                    self.travelDestinations = travelData.travelDestinations
                    self.travelData = travelData
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getRandomTravelTip() {
            if let travelTips = travelData?.travelTips, !travelTips.isEmpty {
                travelTip = travelTips.randomElement() ?? ""
            } 
            showTravelTip = true
        }
    
}
