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
// MARK: - FailureHandable
extension SplashStore: FailureHandable {
  func handle(_ error: Error) {}
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
  }
}

final class SplashStore: ObservableObject {
  @Published var activateNavigationLink = false
  @Published var destinationView: AnyView? {
    didSet { activateNavigationLink = destinationView != nil }
  }
  
  var loadController: ActivatableItemControl = ActivatableItemControl()
  
  init() {
    loadController.action = loadRequiredData(completion:)
  }
}
