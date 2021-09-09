//
//  ExampleBuildToolsManagement
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = MainViewController.instantiate()
        window.makeKeyAndVisible()

        self.window = window

        return true
    }
}
