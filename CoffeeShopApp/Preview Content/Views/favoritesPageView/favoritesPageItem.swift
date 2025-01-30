//
//  favoritesPageItem.swift
//  CoffeeShopApp
//
//  Created by Kamil Porębski on 29/01/2025.
//

import SwiftUI

struct favoritesPageItem: View {
    var coffee: Coffee
    
    var body: some View {
        HStack {
            coffee.image
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .padding(10)
            VStack(alignment: .leading) {
                Text(coffee.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .lineLimit(1)
                HStack {
                    Text("$\(coffee.price, specifier: "%.2f")")
                    Text("\u{00B7}")
                    Text("Size: ")
                    Text(coffee.size[coffee.size.count - 1])
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .environment(\.locale, Locale(identifier: "en_US"))
                .bold()
            }
            Spacer()
            VStack {
                Button {
                    // Logic for adding coffee
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.coffeeBrown)
                        .clipShape(Rectangle())
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .background(Color.white.opacity(0.4))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    favoritesPageItem(coffee: ModelData().coffees[0])
}
