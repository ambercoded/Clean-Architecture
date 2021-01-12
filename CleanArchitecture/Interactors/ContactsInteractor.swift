//
//  ContactsInteractor.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//

/* the protocol of the interactor that will be used by the view to talk to the model. */
import Foundation

protocol ContactsInteractor {
    func add(contact: Contact)
}

/* the concrete implementation */
struct RealContactsInteractor: ContactsInteractor {
    
    let appState: AppState
    
    func add(contact: Contact) {
        appState.contacts.add(contact: contact)
    }
}

struct StubContactsInteractor: ContactsInteractor {
    func add(contact: Contact) {}
}
