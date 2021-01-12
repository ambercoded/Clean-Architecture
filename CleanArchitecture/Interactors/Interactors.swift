//
//  Interactors.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//
/* a struct that groups all interactor protocols (not the concrete implementations).
interactors represent the business logic layer of the app. they are used by views and they can talk to the model.
interactors receive requests for performing work (e.g. compute something or load data from external source). locally-relevant results are treated differently from results with app-wide relevance.
 results with app-wide relevance are not returned directly to the view. they are sent to the AppState. results with local relevance (only a specific view needs them) are sent back to a binding to a property in that view. that local data doesn't have to pollute the AppState. */

import SwiftUI

extension DIContainer {
    struct Interactors {
        let contactsInteractor: ContactsInteractor
        
        // fake contactsInteractor that is required as default value for this to create the required default value for the environmentKey \.injected
        static var stub: Self {
            Interactors.init(contactsInteractor: StubContactsInteractor())
        }
    }
}
