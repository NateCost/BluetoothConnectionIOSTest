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
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
      completion?()
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
        self?.transiteToMainMenu()
      }
    }
  }
  
  func testLoad() -> (Handler?) -> Void {{ [weak self] completion in
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
      completion?()
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
        self?.transiteToMainMenu()
      }
    }
  }}
  
  func transiteToMainMenu() {
    let mainMenuComposer = MainMenuComposer.compose()
    AppDelegate.shared.changeRootViewControllerTo(mainMenuComposer.viewController)
  }
}

final class SplashPresenter {
  weak var view: SplashViewInput!
  
  init(view: SplashViewInput) {
    self.view = view
    self.view.loadController?.action = loadRequiredData(completion:)
    // self.view.loadController?.action = testLoad()
  }
}
