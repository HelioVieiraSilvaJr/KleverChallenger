//
//  AddContactView.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import SwiftUI
import CoreData

struct AddContactView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var cellphone = ""
    @State private var isFavorite : Bool = false
    
    private var contact: FetchedResults<Contact>.Element?
    
    init(contact: Contact? = nil) {
        self.contact = contact
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Nome do contato", text: $name)
                
                TextField("Celular", text: $cellphone)
                
                Toggle(isOn: $isFavorite){
                    Text("É favorito?")
                        .font(.caption)
                }
                
                Button(action: {
                    contact == nil ? save() : edit()
                }) {
                    Text("Salvar")
                }
            }
            .onAppear {
                name = contact?.name ?? ""
                cellphone = contact?.cellphone ?? ""
                isFavorite = contact?.isFavorite ?? false
            }
            .navigationTitle(contact == nil ? "Adicionar contato" : "Editar contato")
        }
    }
    
    private func save() {
        guard name.count > 1 && cellphone.count > 1 else { return }
        
        let newData = Contact(context: viewContext)
        newData.id = UUID()
        newData.name = name
        newData.cellphone = cellphone
        newData.isFavorite = isFavorite
        do{
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("==> Error: \(error.localizedDescription)")
        }
    }
    
    private func edit() {
        viewContext.performAndWait {
            contact?.name = name
            contact?.cellphone = cellphone
            contact?.isFavorite = isFavorite
            try? viewContext.save()
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
