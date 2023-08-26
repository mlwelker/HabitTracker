
import SwiftUI

struct AddHabitView: View {
    @ObservedObject var trackedHabits: TrackedHabits
    
    @State private var habitDescription = ""
    @State private var chosenHabitImage: String?
    
    var habitImage: String {
        chosenHabitImage ?? "checkmark.circle"
    }
    
    @Environment(\.dismiss) var dismiss
    
    let imageOptions: [String?] = [
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
                
                Picker("Image", selection: $chosenHabitImage) {
                    ForEach(imageOptions, id: \.self) {
                        if let name = $0 {
                            Image(systemName: name)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    let habit = Habit(id: UUID(), description: habitDescription, count: 0, image: habitImage)
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
