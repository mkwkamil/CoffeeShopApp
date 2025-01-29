//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 19/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: CoffeeBottomToolbar.Tab = .mainPage
    var body: some View {
        NavigationStack {
            VStack {
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
                
                CoffeeBottomToolbar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
