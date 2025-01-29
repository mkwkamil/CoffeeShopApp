//
//  notificationsPageView.swift
//  CoffeeShop
//
//  Created by Kamil Porębski on 20/01/2025.
//

import SwiftUI

struct notificationsPageView: View {
    var body: some View {
        VStack {
            Text("Notifications")
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "EDEDED"))
        .padding(.bottom, -110)
    }
}

#Preview {
    notificationsPageView()
}
