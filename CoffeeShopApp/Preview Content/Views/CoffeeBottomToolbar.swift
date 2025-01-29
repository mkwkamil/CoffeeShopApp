import SwiftUI

struct CoffeeBottomToolbar: View {
    @Binding var selectedTab: Tab
    
    enum Tab {
        case mainPage
        case favoritesPage
        case shoppingPage
        case notificationsPage
    }
    
    var body: some View {
        HStack(spacing: -20) {
            Button(action: {
                selectedTab = .mainPage
            }) {
                Group {
                    if selectedTab == .mainPage {
                        FilledHomeIcon()
                            .fill(Color(hex: "C67C4E"))
                    } else {
                        StrokedHomeIcon()
                            .fill(Color(hex: "A2A2A2"))
                    }
                }
                .padding()
                .frame(width: 65, height: 65)
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                selectedTab = .favoritesPage
            }) {
                Group {
                    if selectedTab == .favoritesPage {
                        FilledFavoritesIcon()
                            .fill(Color(hex: "C67C4E"))
                    } else {
                        StrokedFavoritesIcon()
                            .fill(Color(hex: "A2A2A2"))
                    }
                }
                .padding()
                .frame(width: 65, height: 65)
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                selectedTab = .shoppingPage
            }) {
                Group {
                    if selectedTab == .shoppingPage {
                        FilledShoppingIcon()
                            .fill(Color(hex: "C67C4E"))
                    } else {
                        StrokedShoppingIcon()
                            .fill(Color(hex: "A2A2A2"))
                    }
                }
                .padding()
                .frame(width: 65, height: 65)
                .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                selectedTab = .notificationsPage
            }) {
                Group {
                    if selectedTab == .notificationsPage {
                        FilledNotificationsIcon()
                            .fill(Color(hex: "C67C4E"))
                    } else {
                        StrokedNotificationsIcon()
                            .fill(Color(hex: "A2A2A2"))

                    }
                }
                .padding()
                .frame(width: 65, height: 65)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.bottom, 40)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 5)
    }
}

#Preview {
    CoffeeBottomToolbar(selectedTab: .constant(.mainPage))
}
