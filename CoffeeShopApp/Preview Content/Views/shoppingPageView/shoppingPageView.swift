//
//  shoppingPageView.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 20/01/2025.
//

import SwiftUI

struct shoppingPageView: View {
    var body: some View {
        VStack {
            Text("Shopping")
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "EDEDED"))
        .padding(.bottom, -110)
    }
}

#Preview {
    shoppingPageView()
}
