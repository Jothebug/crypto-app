//
//  CoinDataService.swift
//  crypto-app
//
//  Created by HaYen on 20/4/25.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            // there are 2 ways for me to use NetworkingManager.handleCompletion
            // #1: .sink(receiveCompletion: NetworkingManager.handleCompletion, ...})
            // #2: .sink(receiveCompletion: { completion in NetworkingManager.handleCompletion(completion: completion }, receiveValue ... })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
