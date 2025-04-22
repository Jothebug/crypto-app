//
//  UIApplication.swift
//  crypto-app
//
//  Created by HaYen on 22/4/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    // this function is to close keyboard when user press close button
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
