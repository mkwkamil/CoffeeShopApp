import SwiftUI

struct mainCoffeeTypes: View {
    @Binding var selectedCoffeeType: String
    @State private var coffeeTypes: [String] = ["All coffee", "Machiato", "Latte", "Americano"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(coffeeTypes, id: \.self) { coffeeType in
                    Button {
                        selectedCoffeeType = coffeeType
                    } label: {
                        Text(coffeeType)
                            .font(.headline)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 11)
                            .foregroundColor(coffeeType == selectedCoffeeType ?
                                .white : .black)
                            .background(coffeeType == selectedCoffeeType ?  Color.coffeeBrown : Color.clear)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    mainCoffeeTypes(selectedCoffeeType: .constant("All coffee"))
}
