//
//  crypto_appApp.swift
//  crypto-app
//
//  Created by HaYen on 14/4/25.
//

import SwiftUI

@main
struct crypto_appApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
