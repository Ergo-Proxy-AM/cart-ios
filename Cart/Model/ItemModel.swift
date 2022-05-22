import SwiftUI

struct Item: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Float
    let currency: String
    let deadline: String
}
