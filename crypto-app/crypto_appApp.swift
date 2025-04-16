//
//  crypto_appApp.swift
//  crypto-app
//
//  Created by HaYen on 14/4/25.
//

import SwiftUI

@main
struct crypto_appApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
