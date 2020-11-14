//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

// MARK: - SplashViewOutput
extension SplashStore: SplashViewOutput {
  func viewDidAppear() {
    loadController.activate()
  }
}
// MARK: - SplashStore
extension SplashStore {
  func loadRequiredData(completion: Handler?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
      completion?()
      self?.transiteToMainMenu()
    }
  }
  
  func transiteToMainMenu() {
    destinationView = AnyView(MainMenuView(start: {}))
    activateNavigationLink.toggle()
  }
}

class SplashStore: ObservableObject {
  @Published var destinationView: AnyView?
  @Published var activateNavigationLink: Bool = false
  
  var loadController: ActivatableItemControl = ActivatableItemControl()
  
  init() {
    loadController.action = loadRequiredData(completion:)
  }
}
