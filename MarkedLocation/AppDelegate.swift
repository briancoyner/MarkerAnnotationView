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

        return true
    }
}

extension AppDelegate {

    private func lazyWindow() -> UIWindow {
        return UIWindow()
    }
}
