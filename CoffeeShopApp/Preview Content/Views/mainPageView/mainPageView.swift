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
        .ignoresSafeArea(.all)
    }
}

#Preview {
    mainPageView()
        .environment(ModelData())
}
