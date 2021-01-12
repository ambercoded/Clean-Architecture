//
//  AppEnvironment.swift
//  CleanArchitecture
//
//  Created by Adrian on 13.01.21.
//

import Foundation

/* the composition root. a place to create all dependencies. this is where modules can be plugged in and out easily. what a joy. */
struct AppEnvironment {
    let container: DIContainer
    // todo: consider adding a systemEventsHandler
}

extension AppEnvironment {
    
    /* configure all your dependencies here. */
    /* webRepositories, dbRepositories, Handlers, interactors. */
    static func bootstrap() -> AppEnvironment {
        let appState = AppState()
        let interactors = configuredInteractors(appState: appState)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredInteractors(appState: AppState) -> DIContainer.Interactors {
        let contactsInteractor = RealContactsInteractor(appState: appState)
        return DIContainer.Interactors(contactsInteractor: contactsInteractor)
    }
}

