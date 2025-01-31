import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class ModelData : ObservableObject {
    @Published var coffees: [Coffee] = []
    private var db = Firestore.firestore()
    private var listener: ListenerRegistration? // Nasłuchiwacz zmian w Firestore

    init() {
        fetchCoffees()
    }

    // Pobierz dane z Firestore
    func fetchCoffees() {
        db.collection("coffees").addSnapshotListener { snapshot, error in
            if let error = error {
                print("Błąd podczas pobierania danych: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("Brak dokumentów w kolekcji 'coffees'")
                return
            }

            // Przekształć dokumenty Firestore na obiekty `Coffee`
            self.coffees = documents.compactMap { document in
                do {
                    return try document.data(as: Coffee.self)
                } catch {
                    print("Błąd podczas dekodowania dokumentu: \(error.localizedDescription)")
                    return nil
                }
            }
        }
    }

    func toggleFavorite(for coffeeId: String) {
        if let index = coffees.firstIndex(where: { $0.id == coffeeId }) {
            coffees[index].isFavorite.toggle()

            if let coffeeId = coffees[index].id {
                db.collection("coffees").document(coffeeId).updateData([
                    "isFavorite": coffees[index].isFavorite
                ]) { error in
                    if let error = error {
                        print("Błąd podczas aktualizacji Firestore: \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    deinit {
        listener?.remove()
    }
}



//import Foundation
//
//@Observable
//class ModelData {
//    var coffees: [Coffee] = load("coffeeData.json")
//
//    func toggleFavorite(for coffeeId: Int) {
//        if let index = coffees.firstIndex(where: { $0.id == coffeeId }) {
//            coffees[index].isFavorite.toggle()
//        }
//    }
//}
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//        fatalError("Couldn't find \(filename) in bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) as Data.")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError(error.localizedDescription)
//    }
//}
