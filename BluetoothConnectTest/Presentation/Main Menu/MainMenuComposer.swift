//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class MainMenuComposer {
  let viewController: MainMenuVC
  
  class func compose() -> MainMenuComposer {
    let controller = MainMenuVC(colorPalette: RegularIOSPalette())
    let presenter = MainMenuPresenter(
      view: controller
    )
    controller.output = presenter
    return MainMenuComposer(viewController: controller)
  }
  
  private init(viewController: MainMenuVC) {
    self.viewController = viewController
  }
}

protocol MainMenuViewInput: class {}

protocol MainMenuViewOutput: class {
  func viewDidLoad()
}
