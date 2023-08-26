
import Foundation

class TrackedHabits: ObservableObject {
    @Published var habits = [Habit]() {
        didSet {
            if let data = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(data, forKey: "habits")
            }
//            self.objectWillChange
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
    
    func incrementHabitCount(id: Habit.ID) {
        // use id to get a copy of habit with that id
        guard let habitIndex = habits.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        // increment that count property
        habits[habitIndex].count += 1
        
        // write back to the array with updated copy
//        habits[habitIndex] = habit
    }
}
