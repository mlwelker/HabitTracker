
import SwiftUI

struct ContentView: View {
    @StateObject var trackedHabits = TrackedHabits()
    
    @State private var showingAddHabit = false
    @State private var habitCount = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(trackedHabits.habits) { habit in
                        HStack {
                            Image(systemName: habit.image)
                            Text("\(habit.description): \(habit.count)")
                            Spacer()
                            Button {
                                // TODO add functionality to increment count
                            } label: {
                                Image(systemName: "plus")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .onDelete(perform: removeHabits)
                } header: {
                    Text("Tracking")
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(trackedHabits: trackedHabits)
            }
        }
    }
    
    func removeHabits(at offsets: IndexSet) {
        trackedHabits.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
