//
//  SortOption.swift
//  crypto-app
//
//  Created by HaYen on 6/5/25.
//

import Foundation

enum SortOption {
    case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
}

extension SortOption {
//    static var defaultOption = SortOption.self
    
    var iconAngle: Double {
        switch self {
            case .rank, .holdings, .price: return 0.0
            case .rankReversed, .holdingsReversed, .priceReversed: return 180
        }
    }
    var rankTapGesture: SortOption {
        switch self {
            case .rank: return .rankReversed
            default: return .rank
        }
    }
    var holdingsTapGesture: SortOption {
        switch self {
            case .holdings: return .holdingsReversed
            default: return .holdings
        }
    }
    var priceTapGesture: SortOption {
        switch self {
            case .price: return .priceReversed
            default: return .price
        }
    }
}
