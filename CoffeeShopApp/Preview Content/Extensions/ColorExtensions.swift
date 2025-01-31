import SwiftUI

extension Color {
    
    static let coffeeBrown = Color(hex: "C67C4E")
    static let coffeeBrownLight = Color(hex: "F9F2ED")
    static let coffeeDark = Color(hex: "1E232C")
    static let coffeeYellow = Color(hex: "FBBE21")
    static let coffeeBlack = Color(hex: "242424")
    static let coffeeGray = Color(hex: "A2A2A2")
    static let coffeeGrayLight = Color(hex: "E3E3E3")
    static let coffeeBack = Color(hex: "EDEDED")
    static let coffeeBackLight = Color(hex: "F9F9F9")
    static let coffeeLocationSelected = Color(hex: "D8D8D8")
    static let coffeeSearchBack = Color(hex: "2A2A2A")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
    
    init(hex: String, opacity: Float) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: Double(opacity))
    }
}
