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
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
