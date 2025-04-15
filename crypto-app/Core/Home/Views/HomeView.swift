//
//  HomeView.swift
//  crypto-app
//
//  Created by HaYen on 14/4/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPorfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            // content layer
            VStack {
                homeHeader
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
}
