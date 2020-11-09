//
//  Created by Ilya Sakalou on 11/9/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class Router {
  class var window: UIWindow? {
    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
      if let sceneDelegate = scene.delegate as? SceneDelegate {
        let window = UIWindow(windowScene: scene)
        sceneDelegate.window = window
        window.makeKeyAndVisible()
        return window
      }
    }
    return nil
  }
  
  static func show<Content: View>(_ content: Content) {
    window?.rootViewController = UIHostingController(rootView: content)
  }
}
