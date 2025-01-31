import SwiftUI

struct authMainView: View {
    @Binding var isUserLoggedIn: Bool
    
    var body: some View {
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
                NavigationLink(destination: loginView(isUserLoggedIn: $isUserLoggedIn)) {
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

#Preview {
    authMainView(isUserLoggedIn: .constant(false))
}
