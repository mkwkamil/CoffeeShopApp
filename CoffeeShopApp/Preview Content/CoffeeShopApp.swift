//
//  CoffeeShopApp.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 19/01/2025.
//

import SwiftUI

@main
struct CoffeeShopApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
