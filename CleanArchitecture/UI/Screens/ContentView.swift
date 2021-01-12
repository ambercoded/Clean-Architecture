//
//  ContentView.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//
/* a view. user interaction or lifecycle events trigger side effects. they are forwarded to the interactors that handle business logic.
@Environment is used to inject "State layer" and "Business logic layer" into the view.
 */
import SwiftUI

struct ContentView: View {
    
    // needed to pass the container in when the view is initialized. the container was created during composition root in appEnvironment.
    private let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    var body: some View {
        ContactsList()
            .inject(container) // injection of the container into the view hierarchy
            .environmentObject(container.appState) // inject the appState as EnvironmentObject to trigger ui updates automatically upon model changes
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .preview)
    }
}
#endif
