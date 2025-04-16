//
//  HomeView.swift
//  crypto-app
//
//  Created by HaYen on 14/4/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPorfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            // content layer
            VStack {
                homeHeader
                columnTitles
                if !showPorfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPorfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0) // have to use minLength: 0 because Spacer() tries to have a non-zero minimum length, which might cause unexpected gaps
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(HomeViewModel())
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPorfolio ? "plus" : "info")
                .animation(.none, value: showPorfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPorfolio)
                )
            Spacer()
            Text(showPorfolio ? "Porfolio" :"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: showPorfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPorfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPorfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, 
                                         bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0,
                                         bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPorfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
