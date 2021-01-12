//
//  DependencyInjector.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//

import SwiftUI

/* this container is handed around and used by all parts of the app to access appState and all interactors.
the container itself is made accessible to any child views by using the env keypath \.injected. helps to achieve loose coupling and modularity. the container is initially created by the AppEnvironment (composition root).
 - usage: perform .inject on the view that should become the rootView. it will then inject the container into the view hierarchy.
*/

struct DIContainer: EnvironmentKey {
    
    // the dependencies that will be accessible from anywhere.
    let appState: AppState
    let interactors: Interactors
    
    // every environmentkey needs a default value.
    static var defaultValue: Self { Self.default }
    
    // provide a stub implementation as default value
    private static let `default` = Self(appState: AppState(), interactors: .stub)
}

// this creates the actual environment value \.injected. allows to access the value later from anywhere.
extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

// create a preview container for debugging
#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(appState: AppState.preview, interactors: .stub)
    }
}
#endif

// MARK: - Injection in the view hierarchy

extension View {
    // creates a container from given appState and interactors. then calls the inject method to make sth the root view.
    func inject(_ appState: AppState,
                _ interactors: DIContainer.Interactors) -> some View {
        let container = DIContainer(appState: appState, interactors: interactors)
        return inject(container)
    }
    
    //  gives the view access to the container via @environment.
    func inject(_ container: DIContainer) -> some View {
        return self
            //.modifier(RootViewAppearance()) // todo opt: prepares the view that gets injected for viewInspector and adds blur on background and to receive status updates
            .environment(\.injected, container)
    }
}
