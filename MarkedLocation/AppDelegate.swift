//
//  Created by Brian Coyner on 7/25/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = self.lazyWindow()
}

extension AppDelegate {

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainViewController = MapViewController()
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        window?.makeKeyAndVisible()

        initializeDefaultAppearance()

        return true
    }
}

extension AppDelegate {

    private func lazyWindow() -> UIWindow {
        return UIWindow()
    }
}

extension AppDelegate {

    private func initializeDefaultAppearance() {
        initializeDefaultNavigationBarAppearance()
        initializeDefaultTabBarAppearance()
    }

    private func initializeDefaultNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()

        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.standardAppearance = appearance
        navigationBarAppearance.scrollEdgeAppearance = appearance
    }

    private func initializeDefaultTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()

        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.standardAppearance = appearance
        tabBarAppearance.scrollEdgeAppearance = appearance
    }
}

