//
//  AppState.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//
/* the apps general state. this acts as a source of truth for all of the data in the app. if only little data is handled, then this can be used to store all the data of the app. the data would be loaded onto AppState at launch and would be updated by the interactors at runtime.
 if there are large amounts of data that should be stored locally, a persistence layer can be added (e.g. to handle Core Data storage). this can be used for better handling of data.
 */

/* My architecture is a variation of Apple's Fruta sample architecture and Alexey Naumov's Clean Architecture variation.
 Key differences:
 - Apple: does not use interactors, AppState is an ObservableObject, does not use a Dependency Injection Container. Does not use Protocols for Dependency inversion.
 - Naumov: uses interactors, does not use ObservableObject, uses a Dependency Injection Container. Uses protocols for Dependency inversion.
 - Adrian: uses interactors, AppState is an ObservableObject, does not use a Dependency Injection Container (yet). Uses protocols for Dependency inversion.
 */

import Foundation

class AppState: ObservableObject {
    
}
