//
//  mainCoffeeTypes.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 20/01/2025.
//

import SwiftUI

struct mainCoffeeTypes: View {
    @State private var selectedCoffeeType: String = "All coffee"
    @State private var coffeeTypes: [String] = ["All coffee", "Machiato", "Latte", "Americano"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(coffeeTypes, id: \.self) { coffeeType in
                    Button {
                        selectedCoffeeType = coffeeType
                    } label: {
                        Text(coffeeType)
                            .font(.headline)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 11)
                            .foregroundColor(coffeeType == selectedCoffeeType ?
                                .white : .black)
                            .background(coffeeType == selectedCoffeeType ?  Color(hex: "C67C4E") : Color(hex: "EDEDED"))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    mainCoffeeTypes()
}
