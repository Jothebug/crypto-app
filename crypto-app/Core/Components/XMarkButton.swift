//
//  XMarkButton.swift
//  crypto-app
//
//  Created by HaYen on 29/4/25.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XMarkButton()
}
