

import SwiftUI

struct NotesListView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var isPresentingAddNote = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: NoteDetailView(viewModel: viewModel, note: note)) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                isPresentingAddNote = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isPresentingAddNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NotesListView()
    }
}
