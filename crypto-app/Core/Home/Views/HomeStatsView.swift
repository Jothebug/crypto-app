//
//  HomeStatsView.swift
//  crypto-app
//
//  Created by HaYen on 24/4/25.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPorfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPorfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showPorfolio: .constant(false))
        .environmentObject(HomeViewModel())
}
