
import Foundation

class TrackedHabits: ObservableObject {
    @Published var habits = [Habit]() {
        didSet {
            if let data = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(data, forKey: "habits")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: data) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
}
