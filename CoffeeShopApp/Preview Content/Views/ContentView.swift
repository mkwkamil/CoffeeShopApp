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
            else {
                ZStack {
                    VStack {
                        Image("loginCoffee")
                            .resizable()
                            .scaleEffect(1.3)
                            .frame(height: 550)
                            .clipped()
                            .cornerRadius(120, corners: .bottomLeft)
                        Spacer()
                    }
                    VStack(spacing: 20) {
                        Spacer()
                        Text("Welcome to Coffee Shop")
                            .font(.title3).bold()
                            .foregroundColor(Color.coffeeDark)
                        NavigationLink(destination: loginView()) {
                            Text("Login")
                                .padding(22)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .font(.title3).bold()
                                .background(Color.coffeeDark)
                                .cornerRadius(8)
                        }
                        NavigationLink(destination: registerView()) {
                            Text("Register")
                                .padding(22)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.coffeeDark)
                                .font(.title3).bold()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.coffeeDark, lineWidth: 2)
                                )
                        }
                        Button(action: {
                            isUserLoggedIn = true
                        }) {
                            Text("Guest Mode")
                                .padding(10)
                                .foregroundColor(Color.coffeeDark)
                                .font(.subheadline).bold()
                                .underline()
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal)
                }
                .ignoresSafeArea(.all)
                .background(Color.coffeeGrayLight)
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
