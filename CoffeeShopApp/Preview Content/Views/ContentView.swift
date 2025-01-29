//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 19/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: CoffeeBottomToolbar.Tab = .favoritesPage
    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .mainPage:
                    mainPageView()
                case .favoritesPage:
                    favoritesPageView()
                case .shoppingPage:
                    shoppingPageView()
                case .notificationsPage:
                    notificationsPageView()
                }
                
                VStack {
                    Spacer()
                    CoffeeBottomToolbar(selectedTab: $selectedTab)
                }
            }
            .background(Color(hex: "EDEDED"))
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
