//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

// MARK: - SplashViewOutput
extension SplashPresenter: SplashViewOutput {
  func viewDidLoad() {
    loadController.activate()
  }
}
// MARK: - SplashPresenter
extension SplashPresenter {
  func loadRequiredData(completion: Handler?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
      completion?()
    }
  }
}

final class SplashPresenter {
  weak var view: SplashViewInput!
  var loadController: ActivatableItem
  
  init(view: SplashViewInput, loadController: ActivatableItem) {
    self.loadController = loadController
    self.loadController.action = loadRequiredData(completion:)
  }
}
