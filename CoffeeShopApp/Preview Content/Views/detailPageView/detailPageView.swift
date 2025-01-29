import SwiftUI

struct detailPageView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ModelData.self) private var modelData
    var coffee: Coffee
    @State private var selectedSize: String

    init(coffee: Coffee) {
        self.coffee = coffee
        _selectedSize = State(initialValue: coffee.size[0])
    }

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    coffee.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: 210)
                        .cornerRadius(16)

                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(coffee.name)
                                .foregroundColor(Color(hex: "242424"))
                                .font(.system(size: 26))
                                .fontWeight(.semibold)
                            HStack(spacing: 15) {
                                VStack(alignment: .leading) {
                                    Text(coffee.flavour)
                                        .foregroundColor(Color(hex: "A2A2A2"))
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color(hex: "FBBE21"))
                                            .font(.title3)
                                        Text("\(coffee.rating, specifier: "%.1f")")
                                            .environment(\.locale, Locale(identifier: "en_US"))
                                            .font(.title3)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        Text("(\(coffee.ratingCount))")
                                            .foregroundStyle(Color(hex: "A2A2A2"))
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

                    Text("Description")
                        .font(.system(size: 21, weight: .semibold, design: .default))
                        .foregroundColor(Color(hex: "242424"))
                        .padding(.bottom, 5)
                    Text(coffee.description)
                        .foregroundColor(Color(hex: "A2A2A2"))
                        .lineLimit(3)
                        .lineSpacing(3)
                        .padding(.bottom, 10)
                    Text("Size")
                        .font(.system(size: 21, weight: .semibold, design: .default))
                        .foregroundColor(Color(hex: "242424"))
                        .padding(.bottom, 10)
                    let columns = Array(Array(repeating: GridItem(.flexible(), spacing: 15), count: 3))
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(coffee.size, id: \.self) { index in
                            Button {
                                selectedSize = index
                            } label: {
                                Text(index)
                                    .foregroundColor(index == selectedSize ? Color(hex: "C67C4E") : Color(hex: "242424"))
                                    .font(.system(size: 17, weight: .medium, design: .default))
                                    .padding(15)
                                    .padding(.horizontal, 30)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(index == selectedSize ? Color(hex: "F9F2ED") : Color.clear)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(index == selectedSize ? Color(hex: "C67C4E") : Color(hex: "E3E3E3"), lineWidth: 2)
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Price")
                        .foregroundColor(Color(hex: "909090"))
                    Text("$\(coffee.price, specifier: "%.2f")")
                        .foregroundColor(Color(hex: "C67C4E"))
                        .environment(\.locale, Locale(identifier: "en_US"))
                        .font(.title2)
                        .bold()
                }.padding(.horizontal, 10)
                Spacer()
                Text("Buy Now")
                    .padding(20)
                    .padding(.horizontal, 50)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(hex: "C67C4E"))
                    )
                    .padding(.horizontal, 10)
            }
            .offset(y: -15)
            .frame(maxWidth: .infinity, minHeight: 100)
            .padding()
            .background(Color.white)
            .cornerRadius(25)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color(hex: "F9F9F9"))
        .onAppear(){
            UIScrollView.appearance().bounces = false
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                        .padding(.top, 40)
                        .padding(.leading)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Detail")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.top, 40)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    modelData.toggleFavorite(for: coffee.id)
                } label: {
                    Group {
                        if coffee.isFavorie == true {
                            FilledFavoritesIcon()
                                .fill(Color(hex: "FBBE21"))
                        } else {
                            StrokedFavoritesIcon()
                                .fill(.black)
                        }
                    }
                        .frame(width: 35, height: 35)
                        .padding(.top, 40)
                        .padding(.trailing)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    detailPageView(coffee: ModelData().coffees[3])
        .environment(ModelData())
}
