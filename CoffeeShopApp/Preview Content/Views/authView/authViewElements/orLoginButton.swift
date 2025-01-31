//
//  orLoginButton.swift
//  CoffeeShopApp
//
//  Created by Kamil Porębski on 31/01/2025.
//

import SwiftUI

struct orLoginButton: View {
    @State var imageName: String
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 30, height: 30)
        }
        .frame(width: 105, height: 56)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.coffeeGray2, lineWidth: 2)
        )
        .padding(2)
    }
}

#Preview {
    orLoginButton(imageName: "appleLogo")
}
