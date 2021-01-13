//
//  Contacts.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//

import Foundation

/* a model that represents all contacts. */
struct Contacts {
    var allContacts = [Contact]()
    
    init() {
        let newContact1 = Contact(name: "Grandma", phoneNumber: "015487562154", priority: 0, dateLastCalled: Date().addingTimeInterval(-1200000))
        allContacts.append(newContact1)
        
        let newContact2 = Contact(name: "Timo", phoneNumber: "015487562154", priority: 0, dateLastCalled: Date().addingTimeInterval(-455500))
        allContacts.append(newContact2)
    }
    
    mutating func add(contact: Contact) {
        allContacts.append(contact)
        print("added \(contact.name). new count of contacts is: \(allContacts.count).")
    }
    
    mutating func delete(contact: Contact) {
        guard let indexOfContact = getIndexOfContact(contact: contact) else { return }
        allContacts.remove(at: indexOfContact)
        print("deleted \(contact.name). new count of contacts is: \(allContacts.count).")
    }
    
    mutating func call(contact: Contact) {
        print("start fake call")
        saveCallToHistory(for: contact)
    }
    
    mutating func saveCallToHistory(for contact: Contact) {
        guard let indexOfContact = getIndexOfContact(contact: contact) else { return }
        allContacts[indexOfContact].dateLastCalled = Date()
    }
    
    func getIndexOfContact(contact: Contact) -> Int? {
        guard let indexOfContact = allContacts.firstIndex(where: { $0.id == contact.id }) else { return nil }
        return indexOfContact
    }
    
    func lookupContact(id: UUID) -> Contact? {
        allContacts.first(where: { $0.id == id })
    }
    
}


/* a model that represents a single contact. */
struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
    var priority: Int
    var dateLastCalled: Date?
}

extension Contact {
    var daysSinceLastCall: Int? {
        guard let dateLastCalled = dateLastCalled else { return nil }
        
        let daysDifference = Calendar.current.dateComponents([.day, .month], from: dateLastCalled, to: Date())
        return Int(daysDifference.day ?? 0)
    }
    
    var daysSinceLastCallText: String {
        switch daysSinceLastCall {
        case nil:
            return "not called yet"
        case 0:
            return "just called"
        default:
            return "last called \(daysSinceLastCall!) days ago"
        }
    }
}

// mocked person for previews
extension Contact {
    static var mocked: Self {
        Contact(name: "John", phoneNumber: "01764545999", priority: 2, dateLastCalled: Date())
    }
}
