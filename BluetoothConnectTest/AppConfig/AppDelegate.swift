//
//  Created by Ilya Sakalou on 10/16/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {
//  var window: UIWindow?
//
//  func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//    window = UIWindow(frame: UIScreen.main.bounds)
//
//    if let window = window {
//      window.rootViewController = SplashComposer.compose().viewController
//      window.makeKeyAndVisible()
//      window.backgroundColor = .white
//    }
//
//    return true
//  }
//

  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(
    _ application: UIApplication,
    didDiscardSceneSessions sceneSessions: Set<UISceneSession>
  ) {}
  
  func changeRootViewControllerTo(_ viewController: UIViewController) {
//    let snapshot: UIView = (window?.snapshotView(afterScreenUpdates: true))!
//    viewController.view.addSubview(snapshot)
//
//    window?.rootViewController = viewController
//
//    UIView.animate(withDuration: 0.3, animations: { () in
//      snapshot.layer.opacity = 0
//      snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
//    }, completion: { _ in
//      snapshot.removeFromSuperview()
//    })
  }
}
// MARK: - AppDelegate
// swiftlint:disable force_cast
extension AppDelegate {
  static var shared = UIApplication.shared.delegate as! AppDelegate
}
