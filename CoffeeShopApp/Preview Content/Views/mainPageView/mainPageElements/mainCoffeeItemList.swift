import SwiftUI

struct mainCoffeeItemList: View {
    @EnvironmentObject private var modelData: ModelData
    var coffees: [Coffee]
    var selectedCoffeeType: String
    
    var filteredCoffees: [Coffee] {
        if selectedCoffeeType == "All coffee" {
            return coffees
        }
        else {
            return coffees.filter {
                $0.category == selectedCoffeeType
            }
        }
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(filteredCoffees, id: \.id) { coffee in
                NavigationLink {
                    detailPageView(coffee: coffee)
                        .environmentObject(modelData)
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
    mainCoffeeItemList(coffees: ModelData().coffees, selectedCoffeeType: "All coffee")
        .environmentObject(ModelData())
}
