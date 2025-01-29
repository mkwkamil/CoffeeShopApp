//
//  favoritesPageView.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 20/01/2025.
//

import SwiftUI

struct favoritesPageView: View {
    @Environment(ModelData.self) private var modelData

    var body: some View {
        VStack {
            List(modelData.coffees.filter{$0.isFavorie}) { coffee in
                Text(coffee.name)
            }        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "EDEDED"))
        .padding(.bottom, -110)
    }
}

#Preview {
    favoritesPageView()
}
