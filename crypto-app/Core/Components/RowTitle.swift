//
//  RowTitle.swift
//  crypto-app
//
//  Created by HaYen on 6/5/25.
//

import SwiftUI

struct RowTitle: View {

    let title: String
    let isIconShown: Bool
    let tapGestureValue: SortOption
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            Image(systemName: "chevron.down")
                .opacity(isIconShown ? 1.0 : 0.0)
                .rotationEffect(Angle(degrees: vm.sortOption.iconAngle))
        }
        .onTapGesture {
            withAnimation(.default) {
                vm.sortOption = tapGestureValue
            }
        }
    }
}

#Preview {
    RowTitle(title: "Coin", isIconShown: true, tapGestureValue: SortOption.price)
}
