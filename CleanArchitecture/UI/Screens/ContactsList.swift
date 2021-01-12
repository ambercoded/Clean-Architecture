//
//  ContactsList.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//

import SwiftUI

struct ContactsList: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.injected) private var injected: DIContainer
    
        
    var body: some View {
        VStack {
            Button("Add person") {
                addContact(Contact.mocked)
            }
            
            List(injected.appState.contacts.allContacts) { contact in
                Text(contact.name)
            }
        }
    }
}

// MARK: - Side Effects

private extension ContactsList {
    func addContact(_ contact: Contact) {
        injected.interactors.contactsInteractor
            .add(contact: contact)
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
