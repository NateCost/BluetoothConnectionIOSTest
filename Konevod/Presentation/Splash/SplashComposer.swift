//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import SwiftUI

final class SplashComposer {
  let view: SplashView<SplashStore>
  
  class func compose() -> SplashComposer {
    let store = SplashStore()
    let controller = SplashView<SplashStore>(logoImage: UIImage(named: "logo") ?? UIImage(), store: store)
    return SplashComposer(view: controller)
  }
  
  private init(view: SplashView<SplashStore>) {
    self.view = view
  }
}

protocol SplashViewInput {}

protocol SplashViewOutput: ObservableObject {
  var destinationView: AnyView? { get }
  var activateNavigationLink: Bool { get set }
  func viewDidLoad()
  func bindLoadController(_ loadController: ActivatableItemControl)
}
