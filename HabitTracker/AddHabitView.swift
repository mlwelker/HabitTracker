
import SwiftUI

struct AddHabitView: View {
    @ObservedObject var trackedHabits: TrackedHabits
    
    @State private var habitDescription = ""
    @State private var habitImage = "checkmark.circle"
    
    @Environment(\.dismiss) var dismiss
    
    let imageOptions = [
        "star",
        "figure.run.circle",
        "character.bubble",
        "gamecontroller",
        "heart",
        "leaf",
    ]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Description", text: $habitDescription)
                
                Picker("Image", selection: $habitImage) {
                    ForEach(imageOptions, id: \.self) {
                        Image(systemName: $0)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    let habit = Habit(description: habitDescription, count: 0, image: habitImage)
                    trackedHabits.habits.append(habit)
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity, minHeight: 30)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(trackedHabits: TrackedHabits())
    }
}
