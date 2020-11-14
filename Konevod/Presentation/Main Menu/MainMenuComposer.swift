//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class MainMenuComposer {
  let view: MainMenuView
  
  class func compose() -> MainMenuComposer {
    let view = MainMenuView(colorPalette: RegularIOSPalette(), start: {})
    let store = MainMenuStore()
    return MainMenuComposer(view: view)
  }
  
  private init(view: MainMenuView) {
    self.view = view
  }
}

protocol MainMenuViewInput: class {}

protocol MainMenuViewOutput: class {
  func viewDidAppear()
}
