//
//  mainPageView.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 20/01/2025.
//

import SwiftUI

struct mainPageView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack(spacing: -60) {
            ScrollView(showsIndicators: false) {
                mainCoffeeTopBar()
                VStack {
                    mainCoffeeBanner()
                    mainCoffeeTypes()
                    mainCoffeeItemList(coffees: modelData.coffees)
                }
                .offset(y: -100)
            }
            .background(Color(hex: "EDEDED"))
            .onAppear(){
                UIScrollView.appearance().bounces = false
            }
        }
        .padding(.bottom, -110)
    }
}

#Preview {
    mainPageView()
        .environment(ModelData())
}
