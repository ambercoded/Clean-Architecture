//
//  ContactDetailView.swift
//  CleanArchitecture
//
//  Created by Adrian on 13.01.21.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.injected) private var injected: DIContainer
    
    @State private var contact: Contact // local copy to update datelastcalled directly after calling. alternative would be to establish a connection to appState and to seek out that one contact.
    @State private var isCalling: Bool = false
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
    }
    
    var body: some View {
        VStack {
            Spacer()
            callButton
            Spacer()
            lastCalledText
            deleteButton
        }
        .navigationTitle(contact.name)
    }
}

// MARK: - Views
extension ContactDetailView {
    var lastCalledText: some View {
        Text(contact.daysSinceLastCallText)
            .font(.caption)
            .foregroundColor(.gray)
            .layoutPriority(1)
            .padding()
    }
    
    var callButton: some View {
        Button(action: {
            callContact()
        }, label: {
            if !isCalling {
                Image(systemName: "phone")
                    .foregroundColor(.green)
                    .font(.system(size: 100))
                    .padding()
            } else {
                Image(systemName: "phone.down.circle.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 100))
                    .padding()
            }
        })
    }
    
    var deleteButton: some View {
        Button(action: {
            deleteContact()
        }, label: {
            HStack {
                Image(systemName: "trash.circle")
                    .foregroundColor(.red)
                
                Text("Remove \(contact.name)'s contact")
                    .foregroundColor(.red)
            }
            .padding()
        })
    }
}

// MARK: - Side Effects
extension ContactDetailView {
    
    func callContact() {
        isCalling.toggle()
        contact.dateLastCalled = Date()
        injected.interactors.contactsInteractor
            .call(contact: contact)
    }
    
    func deleteContact() {
        injected.interactors.contactsInteractor
            .delete(contact: contact)
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact.mocked)
    }
}
