//
//  Created by Ilya Sakalou on 10/31/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

// MARK: - MainMenuViewOutput
extension MainMenuPresenter: MainMenuViewOutput {
  func viewDidLoad() {}
}
// MARK: - MainMenuPresenter
extension MainMenuPresenter {}

final class MainMenuPresenter {
  weak var view: MainMenuViewInput!
  
  init(view: MainMenuViewInput) {
    self.view = view
  }
}
