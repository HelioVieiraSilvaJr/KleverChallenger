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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    ContactCell(contact: contact)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Meus contatos")
            .navigationBarItems(trailing: Button(action: {
                print("==> Open add contact")
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
        }
    }
}

struct CoredataView_Previews: PreviewProvider {
    static var previews: some View {
        CoredataView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

