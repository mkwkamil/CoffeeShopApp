import SwiftUI

struct detailPageView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ModelData.self) private var modelData
    var coffee: Coffee
    @State private var selectedSize: String
    @State private var isDescriptionExpanded = false

    init(coffee: Coffee) {
        self.coffee = coffee
        _selectedSize = State(initialValue: coffee.size[0])
    }

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Text("Detail")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                        }
                        Spacer()
                        Button {
                            modelData.toggleFavorite(for: coffee.id)
                        } label: {
                            Group {
                                if modelData.coffees.first(where: { $0.id == coffee.id })?.isFavorite == true {
                                    FilledFavoritesIcon()
                                        .fill(Color.coffeeYellow)
                                } else {
                                    StrokedFavoritesIcon()
                                        .fill(.black)
                                }
                            }
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 10)
                        }
                    }
                    .padding()
                }
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        coffee.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 210)
                            .cornerRadius(16)

                        HStack {
                            VStack(alignment: .leading, spacing: 3) {
                                Text(coffee.name)
                                    .foregroundColor(Color.coffeeBlack)
                                    .font(.system(size: 26))
                                    .fontWeight(.semibold)
                                HStack(spacing: 15) {
                                    VStack(alignment: .leading) {
                                        Text(coffee.flavour)
                                            .foregroundColor(Color.coffeeGray)
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(Color.coffeeYellow)
                                                .font(.title3)
                                            Text("\(coffee.rating, specifier: "%.1f")")
                                                .environment(\.locale, Locale(identifier: "en_US"))
                                                .font(.title3)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                            Text("(\(coffee.ratingCount))")
                                                .foregroundStyle(Color.coffeeGray)
                                                .font(.headline)
                                        }
                                        .padding(.vertical, 5)
                                    }
                                    Spacer()
                                    detailCoffeeAtribiutes()
                                    detailCoffeeAtribiutes()
                                    detailCoffeeAtribiutes()
                                }
                            }
                        }
                        Divider()
                            .background(.gray)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)

                        HStack {
                            Text("Description")
                                .font(.system(size: 21, weight: .semibold, design: .default))
                                .foregroundColor(Color.coffeeBlack)
                            Spacer()
                            Button(action: {
                                isDescriptionExpanded.toggle()
                            }) {
                                Text(isDescriptionExpanded ? "Show Less" : "Read More")
                                    .foregroundColor(Color.coffeeBrown)
                                    .font(.system(size: 17, weight: .medium, design: .default))
                                    .padding(.horizontal, 15)
                            }
                        }
                        .padding(.bottom, 5)
                        Text(coffee.description)
                            .foregroundColor(Color.coffeeGray)
                            .lineLimit(isDescriptionExpanded ? nil : 3)
                            .lineSpacing(3)
                            .padding(.bottom, 10)

                        Text("Size")
                            .font(.system(size: 21, weight: .semibold, design: .default))
                            .foregroundColor(Color.coffeeBlack)
                            .padding(.bottom, 10)
                        let columns = Array(Array(repeating: GridItem(.flexible(), spacing: 15), count: 3))
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(coffee.size, id: \.self) { index in
                                Button {
                                    selectedSize = index
                                } label: {
                                    Text(index)
                                        .foregroundColor(index == selectedSize ? Color.coffeeBrown : Color.coffeeBlack)
                                        .font(.system(size: 17, weight: .medium, design: .default))
                                        .padding(15)
                                        .padding(.horizontal, 30)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(index == selectedSize ? Color.coffeeBrownLight : Color.clear)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(index == selectedSize ? Color.coffeeBrown : Color.coffeeGrayLight, lineWidth: 2)
                                        )
                                }
                            }
                        }
                        .padding(.bottom, 150)
                    }
                    .padding(.horizontal)
                }
            }
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Price")
                            .foregroundColor(Color.coffeeGray)
                        Text("$\(coffee.price, specifier: "%.2f")")
                            .foregroundColor(Color.coffeeBrown)
                            .environment(\.locale, Locale(identifier: "en_US"))
                            .font(.title2)
                            .bold()
                    }.padding(.horizontal, 10)
                    Spacer()
                    Button {
                        // logic
                    } label: {
                        Text("Buy Now")
                            .padding(20)
                            .padding(.horizontal, 50)
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.coffeeBrown)
                            )
                            .padding(.horizontal, 10)
                    }
                }
                .offset(y: -15)
                .frame(maxWidth: .infinity, minHeight: 100)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.coffeeBackLight)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    detailPageView(coffee: ModelData().coffees[3])
        .environment(ModelData())
}
