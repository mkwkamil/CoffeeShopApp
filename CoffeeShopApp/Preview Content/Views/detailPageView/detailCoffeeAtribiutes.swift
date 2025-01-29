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
                .foregroundColor(Color(hex: "C67C4E"))
                .frame(width: 20, height: 20)
        }
        .padding()
        .background(Color(hex: "EDEDED", opacity: 0.35))
        .cornerRadius(12)    }
}

#Preview {
    detailCoffeeAtribiutes()
}
