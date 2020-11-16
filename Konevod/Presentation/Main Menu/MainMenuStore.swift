//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

// MARK: - MainMenuViewOutput
extension MainMenuStore: MainMenuViewOutput {
  func viewDidAppear() {}
  
  func getText() {
    let text = getTextHandler()
    print(text)
  }
  
  func newGame() {
    print("sfdasda")
  }
}
// MARK: - MainMenuStore
extension MainMenuStore {}

public final class MainMenuStore {
  var getTextHandler: () -> String
  
  internal init(getTextHandler: @escaping () -> String) {
    self.getTextHandler = getTextHandler
  }
}
