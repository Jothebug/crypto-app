//
//  HomeViewModel.swift
//  crypto-app
//
//  Created by HaYen on 16/4/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(MOCKUP_DATA)
            self.portfolioCoins.append(MOCKUP_DATA)
        }
    }
    
}
