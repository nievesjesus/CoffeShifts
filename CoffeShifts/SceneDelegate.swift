//
//  SceneDelegate.swift
//  CoffeShifts
//
//  Created by Jesus Nieves on 07/03/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            configureApplication()
            window?.makeKeyAndVisible()
        }

        // swiftlint:disable unused_optional_binding
        guard let _ = (scene as? UIWindowScene) else { return }

    }

    func configureApplication() {
        ShiftsStore.shared.initShifts()
        let navController = NavigationController()
        let mainViewController = ShiftsListModule.build(with: navController)
        navController.setViewControllers([mainViewController], animated: true)
        self.window?.rootViewController = navController
    }
}
