//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

extension SplashPresenter: SplashViewOutput {
  func viewDidLoad() {
    loadController.action = { completion in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        completion?()
      }
    }
    
    loadController.activate()
  }
}

final class SplashPresenter {
  weak var view: SplashViewInput!
  var loadController: ActivatableItem
  
  init(view: SplashViewInput, loadController: ActivatableItem) {
    self.loadController = loadController
  }
}
