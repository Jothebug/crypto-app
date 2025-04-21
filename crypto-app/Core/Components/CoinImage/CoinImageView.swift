//
//  CoinImageView.swift
//  crypto-app
//
//  Created by HaYen on 21/4/25.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel

    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
        // _vm (note the underscore!) which is the backing storage of @StateObject.
        // the initializer is used for initing the view with @StateObject CoinImageViewModel when I add MOCKUP_DATA
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: MOCKUP_DATA)
}
