import SwiftUI

struct mainCoffeeItemList: View {
    var coffees: [Coffee]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(coffees, id: \.id) { coffee in
                NavigationLink {
                    detailPageView(coffee: coffee)
                } label: {
                    mainCoffeeItem(coffee: coffee)
                }
            }
        }
        .padding()
        .padding(.bottom, 5)
    }
}

#Preview {
    mainCoffeeItemList(coffees: ModelData().coffees)
        .environment(ModelData())
}
