//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class SplashComposer {
  let viewController: SplashView
  
  class func compose() -> SplashComposer {
    var controller = SplashView()
    let presenter = SplashPresenter(
      view: controller
    )
    controller.output = presenter
    return SplashComposer(viewController: controller)
  }
  
  private init(viewController: SplashView) {
    self.viewController = viewController
  }
}

protocol SplashViewInput {
  var loadController: ActivatableItem? { get set }
}

protocol SplashViewOutput: class {
  func viewDidLoad()
}
