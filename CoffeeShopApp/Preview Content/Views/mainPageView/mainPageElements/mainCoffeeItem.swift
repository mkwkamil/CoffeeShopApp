import SwiftUI

struct mainCoffeeItem: View {
    var coffee: Coffee
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text("\(coffee.rating, specifier: "%.1f")")
                        .environment(\.locale, Locale(identifier: "en_US"))
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .font(.caption)
                }
                .padding(10)
                .background(.black.opacity(0.25))
                .cornerRadius(24, corners: .bottomLeft)
                .cornerRadius(12, corners: .topRight)
                .zIndex(5)
                coffee.image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            }
            
            Text(coffee.name)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(1)
            
            Text(coffee.flavour)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Text("$\(coffee.price, specifier: "%.2f")")
                    .foregroundColor(.black)
                    .environment(\.locale, Locale(identifier: "en_US"))
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button {
                    // Logic for adding coffee
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(red: 198 / 255, green: 124 / 255, blue: 78 / 255))
                        .clipShape(Rectangle())
                        .cornerRadius(12)
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 5)
    }
}

#Preview {
    mainCoffeeItem(coffee: ModelData().coffees[0])
}
