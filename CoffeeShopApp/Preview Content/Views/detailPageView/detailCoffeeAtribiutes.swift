//
//  detailCoffeeAtribiutes.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 21/01/2025.
//

import SwiftUI

struct detailCoffeeAtribiutes: View {
    var body: some View {
        ZStack {
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(Color.coffeeBrown)
                .frame(width: 20, height: 20)
        }
        .padding()
        .background(Color.coffeeBack.opacity(0.35))
        .cornerRadius(12)
    }
}

#Preview {
    detailCoffeeAtribiutes()
}
