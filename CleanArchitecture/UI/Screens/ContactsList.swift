//
//  ContactsList.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//

import SwiftUI

struct ContactsList: View {
    @EnvironmentObject private var appState: AppState
        
    var body: some View {
        VStack {
            Button("Add person") {
                
            }
            
            List(appState.contacts.allContacts) { contact in
                Text(contact.name)
            }
        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
