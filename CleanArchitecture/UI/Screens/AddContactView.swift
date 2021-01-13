//
//  AddContactView.swift
//  CleanArchitecture
//
//  Created by Adrian on 13.01.21.
//

import SwiftUI

struct AddContactView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.injected) private var injected: DIContainer
    
    @State private var name: String = ""
    @State private var telephoneNumber: String = ""
    @State private var priority: Int = 0
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter a name", text: $name)
            }
            
            Section(header: Text("Phone")) {
                TextField("Enter a number", text: $telephoneNumber)
            }
            
        }
        .navigationTitle("Add a contact")
        .navigationBarItems(trailing: Button("Done") {
            addContact()
            presentationMode.wrappedValue.dismiss()
        })
    }
}

// MARK: - Side Effects
extension AddContactView {
    func addContact() {
        guard !name.isEmpty && !telephoneNumber.isEmpty else { return }
        let newContact = Contact(name: name, phoneNumber: telephoneNumber, priority: priority, dateLastCalled: nil)
        
        injected.interactors.contactsInteractor
            .add(contact: newContact)
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
