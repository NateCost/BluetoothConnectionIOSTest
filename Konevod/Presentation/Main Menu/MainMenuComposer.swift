//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class MainMenuComposer {
  let view: MainMenuView<MainMenuStore, TextInputStore>
  
  class func compose() -> MainMenuComposer {
    let store = MainMenuStore()
    let textInputComposer = TextInputComposer.compose()
    
    let view = MainMenuView<MainMenuStore, TextInputStore>(
      colorPalette: RegularIOSPalette(),
      textInputView: textInputComposer.view,
      store: store
    )
    return MainMenuComposer(view: view)
  }
  
  private init(view: MainMenuView<MainMenuStore, TextInputStore>) {
    self.view = view
  }
}

protocol MainMenuViewInput: class {}

protocol MainMenuViewOutput: ObservableObject {
  func viewDidAppear()
  func continueGame()
  func newGame()
}
