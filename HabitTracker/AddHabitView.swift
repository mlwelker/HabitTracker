
import SwiftUI

struct AddHabitView: View {
    @State private var habitDescription = ""
    @State private var habitImage = ""
    
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
//                .pickerStyle(.menu)
//                .pickerStyle(.inline)
//                .pickerStyle(.navigationLink)
                .pickerStyle(.segmented)
//                .pickerStyle(.wheel)
                
                Button {
                    // TODO
                    // create new habit item
                    // append to habit list
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
                    // TODO
                    // create new habit item
                    // append to habit list
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
        AddHabitView()
    }
}
