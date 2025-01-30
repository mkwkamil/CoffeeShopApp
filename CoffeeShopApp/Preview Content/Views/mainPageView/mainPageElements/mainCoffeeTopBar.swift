//
//  mainCoffeeTopBar.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 20/01/2025.
//

import SwiftUI

struct mainCoffeeTopBar: View {
    @State private var coffeeName = ""
    @State private var selectedLocation = "Bilzen, Tanjungbalai"
    @State private var locations: [String] = ["Bilzen, Tanjungbalai", "New York, USA", "Tokyo, Japan", "London, UK"]

    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Location")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Menu {
                    ForEach(locations, id: \.self) { location in
                        Button(action: {
                            selectedLocation = location
                        }) {
                            Text(location)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedLocation)
                            .foregroundColor(.white)
                            .font(.headline)
                            .foregroundColor(Color.coffeeLocationSelected)
//                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.coffeeLocationSelected)
                    }
                }
            }
            .padding(.horizontal)
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                    TextField("",
                        text: $coffeeName,
                        prompt: Text("Search coffee")
                        .foregroundColor(Color.coffeeGray)
                    )
                    .foregroundColor(Color.coffeeGray)
                }
                .padding(22)
                .background(Color.coffeeSearchBack)
                .cornerRadius(20)
                Button {
                    // logika
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.coffeeBrown)
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .padding()
                }
            }.padding()
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "111111"), Color(hex: "313131")]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
        )
    }
}

#Preview {
    mainCoffeeTopBar()
}
