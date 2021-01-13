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
    
    @State private var showingAddContactView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(injected.appState.contacts.allContacts) { contact in
                    Text(contact.name)
                }
            }
            .navigationTitle("Stay in touch with ...")
            .navigationBarItems(trailing: Button(action: {
                showingAddContactView.toggle()
            }, label: {
                Image(systemName: "plus")
                Text("New contact")
            }))
        }
        .sheet(isPresented: $showingAddContactView) {
            NavigationView {
                AddContactView()
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
