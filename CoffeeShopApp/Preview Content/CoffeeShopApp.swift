import SwiftUI
import FirebaseCore

@main
struct CoffeeShopApp: App {
    @StateObject private var modelData = ModelData()
    
    init() {
        FirebaseApp.configure()
        print("Firebase został skonfigurowany!")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(ModelData())                
            }
        }
    }
}
