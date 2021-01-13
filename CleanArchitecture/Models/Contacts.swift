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
        let newContact1 = Contact(name: "Anna", phoneNumber: "015487562154", priority: 0, dateLastCalled: Date())
        allContacts.append(newContact1)
        
        let newContact2 = Contact(name: "Barbara", phoneNumber: "015487562154", priority: 0, dateLastCalled: Date())
        allContacts.append(newContact2)
    }
    
    mutating func add(contact: Contact) {
        allContacts.append(contact)
        print("added \(contact.name). new count of contacts is: \(allContacts.count).")
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

// mocked person for previews
extension Contact {
    static var mocked: Self {
        Contact(name: "John", phoneNumber: "01764545999", priority: 2, dateLastCalled: Date())
    }
}
