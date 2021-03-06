//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

final class SplashComposer {
  let view: SplashView<SplashStore>
  
  class func compose() -> SplashComposer {
    let view = SplashView(store: SplashStore())
    return SplashComposer(view: view)
  }
  
  private init(view: SplashView<SplashStore>) {
    self.view = view
  }
}

protocol SplashViewOutput: ObservableObject {
  var destinationView: AnyView? { get }
  var activateNavigationLink: Bool { get set }
  var loadController: ActivatableItemControl { get }
  func viewDidAppear()
}

protocol FailureHandable: class {
  func handle(_ error: Error)
}
