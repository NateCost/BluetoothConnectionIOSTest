//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation
import UIKit

final class SplashComposer {
  let view: SplashView
  
  class func compose() -> SplashComposer {
    var controller = SplashView(logoImage: UIImage(named: "logo") ?? UIImage())
    let presenter = SplashPresenter(view: controller)
    controller.output = presenter
    return SplashComposer(view: controller)
  }
  
  private init(view: SplashView) {
    self.view = view
  }
}

protocol SplashViewInput {
  var loadController: ActivatableItem? { get set }
}

protocol SplashViewOutput: class {
  func viewDidLoad()
}
