
import SwiftUI

struct ContentView: View {
    @State private var firstCount = 3
    @State private var secondCount = 3
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: "figure.run.circle")
                        Text("Exercise: \(firstCount)")
                        Spacer()
                        Stepper("", value: $firstCount)
                    }
                    HStack {
                        Image(systemName: "character.bubble")
                        Text("Japanese: \(secondCount)")
                        Spacer()
                        Stepper("", value: $secondCount)
                    }
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
                AddHabitView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
