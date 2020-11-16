//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class MainMenuComposer {
  let view: MainMenuView<MainMenuStore>
  
  class func compose() -> MainMenuComposer {
    let store = MainMenuStore()
    let view = MainMenuView(colorPalette: RegularIOSPalette(), store: store)
    return MainMenuComposer(view: view)
  }
  
  private init(view: MainMenuView<MainMenuStore>) {
    self.view = view
  }
}

protocol MainMenuViewInput: class {}

protocol MainMenuViewOutput: ObservableObject {
  func viewDidAppear()
  func continueGame()
  func newGame()
}
