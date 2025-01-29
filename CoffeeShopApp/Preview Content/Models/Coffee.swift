import Foundation
import SwiftUI

struct Coffee: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var flavour: String
    var size: [String]
    var description: String
    var price: Double
    var rating: Double
    var ratingCount: Int
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
