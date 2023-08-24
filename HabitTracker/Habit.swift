
import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    let description: String
    var count: Int
    var image: String
}
