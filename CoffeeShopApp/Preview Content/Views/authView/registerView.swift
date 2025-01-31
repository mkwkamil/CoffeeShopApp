import SwiftUI
import FirebaseAuth

struct registerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    @State private var isPasswordVisible: Bool = false
    @Binding var isUserLoggedIn: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.coffeeDark)
                        .frame(width: 50, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.coffeeGrayLight, lineWidth: 2)
                        )
                }
            }
            .padding(.top, 20)
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Hello! Register to get started!")
                    .foregroundColor(Color.coffeeDark)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                TextField("Username",
                    text: $username,
                    prompt: Text("Username")
                        .foregroundColor(Color.coffeeGray)
                    )
                    .frame(height: 65)
                    .padding(.horizontal, 22)
                    .foregroundColor(Color.coffeeDark)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.coffeeGrayLight2)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.coffeeGray2, lineWidth: 2)
                    )
                TextField("Email",
                    text: $email,
                    prompt: Text("Email")
                        .foregroundColor(Color.coffeeGray)
                    )
                    .frame(height: 65)
                    .padding(.horizontal, 22)
                    .foregroundColor(Color.coffeeDark)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.coffeeGrayLight2)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.coffeeGray2, lineWidth: 2)
                    )
                TextField("Password",
                    text: $password,
                    prompt: Text("Password")
                        .foregroundColor(Color.coffeeGray)
                    )
                    .frame(height: 65)
                    .padding(.horizontal, 22)
                    .foregroundColor(Color.coffeeDark)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.coffeeGrayLight2)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.coffeeGray2, lineWidth: 2)
                    )
                TextField("Confirm Password",
                    text: $passwordConfirm,
                    prompt: Text("Confirm Password")
                        .foregroundColor(Color.coffeeGray)
                    )
                    .frame(height: 65)
                    .padding(.horizontal, 22)
                    .foregroundColor(Color.coffeeDark)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.coffeeGrayLight2)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.coffeeGray2, lineWidth: 2)
                    )
                Button {
                    if password == passwordConfirm {
                        AuthService.shared.registerWithEmailAndPassword(email: email, password: password, username: username) { success, error in
                            if success {
                                isUserLoggedIn = true
                                dismiss()
                            } else {
                                print("Błąd rejestracji: \(error?.localizedDescription ?? "Nieznany błąd")")
                            }
                        }
                    } else {
                        print("Hasła nie są identyczne!")
                    }
                } label: {
                    Text("Register")
                        .padding(22)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.title3).bold()
                        .background(Color.coffeeDark)
                        .cornerRadius(8)
                }
                HStack {
                    Rectangle()
                        .frame(height: 1)
                    
                    Text("Or Register with")
                        .padding(.horizontal, 8)
                        .foregroundColor(Color.coffeeGrayDark)
                        .fontWeight(.medium)
                        .layoutPriority(1)
                    
                    Rectangle()
                        .frame(height: 1)
                }
                .foregroundColor(Color.coffeeGray)
                HStack {
                    Button(action: {
                        // btn logic
                    }) {
                        orLoginButton(imageName: "facebookLogo")
                    }
                    Button(action: {
                        // btn logic
                    }) {
                        orLoginButton(imageName: "googleLogo")
                    }
                    Button(action: {
                        // btn logic
                    }) {
                        orLoginButton(imageName: "appleLogo")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .foregroundColor(Color.coffeeDark)
                    NavigationLink(destination: loginView(isUserLoggedIn: $isUserLoggedIn), label: {
                        Text("Login now")
                    })
                    Spacer()
                }
                
            }
            .padding(10)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .background(.white)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
#Preview {
    registerView(isUserLoggedIn: .constant(false))
}
