import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Coffee: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var category: String
    var flavour: String
    var size: [String]
    var description: String
    var price: Double
    var rating: Double
    var ratingCount: Int
    var isFavorite: Bool
    var imageName: String

    var image: Image {
        Image(imageName)
    }
}
