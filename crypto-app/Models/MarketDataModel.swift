//
//  MarketDataModel.swift
//  crypto-app
//
//  Created by HaYen on 26/4/25.
//

import Foundation

/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 16989,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1290,
     "total_market_cap": {
       "btc": 32474810.234088,
       "eth": 1699736031.09254,
       "ltc": 35371369396.106,
       "bch": 8508082714.75277,
       "bnb": 5032704157.04701,
       "eos": 4473601434314.11,
       "xrp": 1390125038362.07,
       "xlm": 10571354627242.1,
       "link": 205163453031.083,
       "dot": 714628899064.027,
       "yfi": 559053773.366363,
       "usd": 3063095758311.79,
       "aed": 11250750720279.2,
       "ars": 3564478051469293,
     },
     "total_volume": {
       "btc": 866964.396977816,
       "eth": 45377035.6961407,
       "ltc": 944292444.443156,
       "bch": 227136194.085913,
       "bnb": 134355683.473774,
       "eos": 119429586866.319,
       "xrp": 37111499864.6636,
       "xlm": 282218372442.57,
       "link": 5477150075.91557,
       "dot": 19078104169.786,
       "yfi": 14924789.8297489,
       "usd": 81773994916.2988,
       "aed": 300355883327.566,
       "ars": 95159156963724.1,
       "aud": 127591964267.901,
       "bdt": 9935149093764.64,
       "bhd": 30819228526.0395,
       "bmd": 81773994916.2988,
       "brl": 465326740671.707,
       "cad": 113555458040.518,
       "chf": 67733399989.1703,
       "clp": 76454596546993.6,
       "cny": 595944342751.511,
       "czk": 1797237119443.9,
       "dkk": 537181550004.659,
       "eur": 71723970941.0857,
       "gbp": 61424209185.3982,
       "gel": 223856311083.368,
       "hkd": 634463983056.834,
       "huf": 29189227485372.9,
       "idr": 1.37413021057349e+15,
       "ils": 296351410796.515,
       "inr": 6982252112429.45,
       "jpy": 11748875566394,
       "krw": 117620710565223,
       "kwd": 25083764070.6001,
     },
     "market_cap_percentage": {
       "btc": 61.1442556765339,
       "eth": 7.10020782329765,
       "usdt": 4.80272691228735,
       "xrp": 4.20090192537437,
       "bnb": 2.89697850900387,
       "sol": 2.52122703087669,
       "usdc": 2.03566575383623,
       "doge": 0.885795803436272,
       "ada": 0.833894244440667,
       "trx": 0.77941619570575
     },
     "market_cap_change_percentage_24h_usd": -2.23907654135482,
     "updated_at": 1745685400
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "\(item.value)"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "\(item.value)"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
