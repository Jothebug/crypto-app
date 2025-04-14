//
//  ContentView.swift
//  crypto-app
//
//  Created by HaYen on 14/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("AccentColor")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle( Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    ContentView()
}
