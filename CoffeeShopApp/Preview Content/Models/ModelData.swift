import Foundation

@Observable
class ModelData {
    var coffees: [Coffee] = load("coffeeData.json")
    
    func toggleFavorite(for coffeeId: Int) {
        if let index = coffees.firstIndex(where: { $0.id == coffeeId }) {
            coffees[index].isFavorite.toggle()
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) as Data.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(error.localizedDescription)
    }
}
