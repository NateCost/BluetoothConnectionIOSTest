//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

// MARK: - SplashViewOutput
extension SplashPresenter: SplashViewOutput {
  func viewDidLoad() {
    view.loadController?.activate()
  }
}
// MARK: - SplashPresenter
extension SplashPresenter {
  func loadRequiredData(completion: Handler?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
      completion?()
    }
  }
  
  func transiteToMainMenu() {
    let mainMenuComposer = MainMenuComposer.compose()
    AppDelegate.shared.changeRootViewControllerTo(mainMenuComposer.viewController)
  }
}

final class SplashPresenter {
  var view: SplashViewInput
  
  init(view: SplashViewInput) {
    self.view = view
    self.view.loadController?.action = loadRequiredData(completion:)
  }
}
