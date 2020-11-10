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
  
  static func show<Content: View>(
    _ content: Content,
    animated: Bool = true,
    completion: Handler? = nil
  ) {
    guard let window = window else { completion?(); return }
    
    window.rootViewController = UIHostingController(rootView: content)

    if animated {
      let options: UIView.AnimationOptions = .transitionCrossDissolve
      let duration: TimeInterval = 0.3

      UIView.transition(
        with: window,
        duration: duration,
        options: options,
        animations: {},
        completion: { _ in completion?() }
      )
    }
  }
}
