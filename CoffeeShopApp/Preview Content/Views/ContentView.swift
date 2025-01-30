import SwiftUI

struct ContentView: View {
    @State private var selectedTab: CoffeeBottomToolbar.Tab = .mainPage
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
            .background(Color.coffeeBack)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
