//
//  CoredataView.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//

import SwiftUI
import CoreData

struct CoredataView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Contact.entity(), sortDescriptors: [])

    var contacts: FetchedResults<Contact>
    @State private var showAddContactSheet = false
    @State private var showEditContactSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(contact.name ?? "-")
                                .font(.headline)
                            Text(contact.cellphone ?? "")
                                .font(.subheadline)
                        }
                        Spacer()
                        Button(action: {
                            showEditContactSheet = true
                        }, label: {
                        })
                        Button(action: {
                            toggleFavorite(contact: contact)
                        }) {
                            Image(systemName: contact.isFavorite ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }.buttonStyle(PlainButtonStyle())
                        
                        
                    }
                    .frame(height: 60)
                    .sheet(isPresented: $showEditContactSheet, content: {
                        AddContactView(contact: contact)
                    })
                }
                .onDelete(perform: { indexSet in
                    delete(indexSet: indexSet)
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Meus contatos")
            .navigationBarItems(trailing: Button(action: {
                showAddContactSheet = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showAddContactSheet) {
                AddContactView()
            }
        }
    }
    
    private func toggleFavorite(contact: Contact) {
        viewContext.performAndWait {
            contact.isFavorite.toggle()
            try? viewContext.save()
        }
    }
    
    private func delete(indexSet: IndexSet) {
        for index in indexSet {
            viewContext.delete(contacts[index])
            do {
                try viewContext.save()
            } catch {
                print("==> Error delete: \(error.localizedDescription)")
            }
        }
    }
}

struct CoredataView_Previews: PreviewProvider {
    static var previews: some View {
        CoredataView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

