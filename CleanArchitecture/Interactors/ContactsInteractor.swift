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
    func delete(contact: Contact)
    func call(contact: Contact)
    func lookUpContact(id: UUID) -> Contact?
}

/* the concrete implementation */
struct RealContactsInteractor: ContactsInteractor {
   
    let appState: AppState
    
    func add(contact: Contact) {
        appState.contacts.add(contact: contact)
    }
    
    func delete(contact: Contact) {
        appState.contacts.delete(contact: contact)
    }
    
    func call(contact: Contact) {
        appState.contacts.call(contact: contact)
    }
    
    
    func lookUpContact(id: UUID) -> Contact? {
        appState.contacts.lookupContact(id: id)
    }
}

struct StubContactsInteractor: ContactsInteractor {
    func add(contact: Contact) {}
    func delete(contact: Contact) {}
    func call(contact: Contact) {}
    func lookUpContact(id: UUID) -> Contact? { return Contact.mocked }
}
