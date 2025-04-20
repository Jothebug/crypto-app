//
//  HomeViewModel.swift
//  crypto-app
//
//  Created by HaYen on 16/4/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        //            self.allCoins.append(MOCKUP_DATA)
        //            self.portfolioCoins.append(MOCKUP_DATA)
        //        }
        addSubcribers()
    }
    
    func addSubcribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
