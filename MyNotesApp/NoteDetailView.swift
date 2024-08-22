
import SwiftUI

struct NoteDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: NotesViewModel
    
    @State private var note: Note
    
    init(viewModel: NotesViewModel, note: Note) {
        self.viewModel = viewModel
        _note = State(initialValue: note)
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $note.title)
                .onChange(of: note.title) { newValue in
                }
            TextEditor(text: $note.content)
                .frame(height: 200)
        }
        .navigationTitle("Edit Note")
        .navigationBarItems(trailing: Button("Save") {
            viewModel.updateNote(note)
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(note.title.trimmingCharacters(in: .whitespaces).isEmpty)
        )
    }
}
