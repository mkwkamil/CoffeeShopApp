

import SwiftUI

struct mainPageView: View {
    @EnvironmentObject private var modelData: ModelData
    @State private var selectedCoffeeTypes = "All coffee"
    
    var body: some View {
        VStack(spacing: -60) {
            ScrollView(showsIndicators: false) {
                mainCoffeeTopBar()
                VStack {
                    mainCoffeeBanner()
                    mainCoffeeTypes(selectedCoffeeType: $selectedCoffeeTypes)
                    mainCoffeeItemList(coffees: modelData.coffees, selectedCoffeeType: selectedCoffeeTypes)
                }
                .offset(y: -100)
            }
            .background(Color.coffeeBack)
            .onAppear(){
                UIScrollView.appearance().bounces = false
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    mainPageView()
        .environmentObject(ModelData())
}
