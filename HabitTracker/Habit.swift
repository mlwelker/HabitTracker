
import Foundation

struct Habit: Identifiable, Codable {
    typealias ID = UUID
    var id: ID
    let description: String
    var count: Int
    var image: String
}
