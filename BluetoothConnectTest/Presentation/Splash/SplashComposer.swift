//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class SplashComposer {
  let viewController: SplashVC
  
  class func compose() -> SplashComposer {
    let controller = SplashVC()
    let presenter = SplashPresenter(
      view: controller,
      loadController: ActivatableItemControl(item: controller.spinnerView)
    )
    controller.output = presenter
    return SplashComposer(viewController: controller)
  }
  
  private init(viewController: SplashVC) {
    self.viewController = viewController
  }
}

protocol SplashViewInput: class {}

protocol SplashViewOutput: class {
  func viewDidLoad()
}
