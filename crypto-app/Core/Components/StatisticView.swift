//
//  StatisticView.swift
//  crypto-app
//
//  Created by HaYen on 24/4/25.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: isNegativePercentageChange ? 180 :0))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor(isNegativePercentageChange ? Color.theme.red : Color.theme.green)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
    private var isNegativePercentageChange: Bool {
        (stat.percentageChange ?? 0) < 0
    }
}

//@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(stat: STATISTIC_DATA_1)
        .preferredColorScheme(.dark)
}
