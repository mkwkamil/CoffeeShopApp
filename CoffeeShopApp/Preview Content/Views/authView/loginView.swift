import SwiftUI

struct loginView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
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
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome back! Glad to see you, Again!")
                    .foregroundColor(Color.coffeeDark)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineSpacing(4)
                    .padding(.bottom)
                
                TextField("Enter your email",
                    text: $email,
                    prompt: Text("Enter your email")
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
                
                HStack {
                    if isPasswordVisible {
                        TextField("Enter your password",
                                  text: $password,
                                  prompt: Text("Enter your password")
                                    .foregroundColor(Color.coffeeGray)
                        )
                    } else {
                        SecureField("Enter your password",
                                    text: $password,
                                    prompt: Text("Enter your password")
                                        .foregroundColor(Color.coffeeGray)
                        )
                    }

                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(Color.coffeeGray)
                    }
                }
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
                HStack {
                    Spacer()
                    NavigationLink {
                        // passwordReset()
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.coffeeGrayDark)
                    }
                }
                NavigationLink(destination: loginView()) {
                    Text("Login")
                        .padding(22)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.title3).bold()
                        .background(Color.coffeeDark)
                        .cornerRadius(8)
                }
                .padding(.vertical)
                HStack {
                    Rectangle()
                        .frame(height: 1)
                    
                    Text("Or Login with")
                        .padding(.horizontal, 8)
                        .foregroundColor(Color.coffeeGrayDark)
                        .fontWeight(.medium)
                        .layoutPriority(1)
                    
                    Rectangle()
                        .frame(height: 1)
                }
                .foregroundColor(Color.coffeeGray)
                HStack {
                    orLoginButton(imageName: "facebookLogo")
                    orLoginButton(imageName: "googleLogo")
                    orLoginButton(imageName: "appleLogo")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                        .foregroundColor(Color.coffeeDark)
                    NavigationLink(destination: registerView(), label: {
                        Text("Register now")
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
    NavigationStack {
        loginView()
    }
}
