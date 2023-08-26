
import SwiftUI

struct HabitView: View {
    let habit: Habit
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: habit.image)
            Text(habit.description)
            Text("\(habit.count)")
            Spacer()
            Spacer()
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: Habit(id: UUID(), description: "Example", count: 2, image: "paperplane"))
    }
}
