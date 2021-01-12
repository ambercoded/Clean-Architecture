//
//  SceneDelegate.swift
//  CleanArchitecture
//
//  Created by Adrian on 12.01.21.
//

import UIKit
import SwiftUI

/* entry point of the app. creates the appEnvironment which acts as the composition root to create and wire up all dependencies. */
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        /* use appEnvironment as composition root to create all dependencies */
        let environment = AppEnvironment.bootstrap()
        let contentView = ContentView(container: environment.container)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        // todo: consider creating a systemEventsHandler here.
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

