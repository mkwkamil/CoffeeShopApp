import SwiftUI

struct favoritesPageView: View {
    @Environment(ModelData.self) private var modelData

    var body: some View {
        VStack {
            HStack {
                Text("Your Favorites")
                    .font(.title3.bold())
                    .padding(10)
                
            }
            .foregroundColor(.black)
            ScrollView(showsIndicators: false) {
                VStack {

                    ForEach(modelData.coffees.filter{$0.isFavorite}, id: \.id) { coffee in
                        NavigationLink {
                            detailPageView(coffee: coffee)
                        } label: {
                            favoritesPageItem(coffee: coffee)
                        }
                    }
                }
                .padding(.bottom, 120)
            }
            .background(Color.coffeeBack)
        }
    }
}

#Preview {
    favoritesPageView()
        .environment(ModelData())
}
