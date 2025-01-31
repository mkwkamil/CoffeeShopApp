import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var selectedTab: CoffeeBottomToolbar.Tab = .mainPage
    @State private var isUserLoggedIn = false
    
    var body: some View {
        VStack {
            if isUserLoggedIn {
                ZStack {
                    switch selectedTab {
                    case .mainPage:
                        mainPageView(isUserLoggedIn: $isUserLoggedIn)
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
            else {
                authMainView(isUserLoggedIn: $isUserLoggedIn)
            }
        }
        .onAppear {
            checkIfLoggedIn()
        }
    }
    private func checkIfLoggedIn() {
        if Auth.auth().currentUser != nil {
            isUserLoggedIn = true
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
