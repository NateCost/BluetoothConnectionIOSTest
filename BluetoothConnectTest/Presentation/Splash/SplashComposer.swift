//
//  Created by Ilya Sakalou on 10/30/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import Foundation

final class SplashComposer {
  let viewController: SplashVC
  
  class func compose() -> SplashComposer {
    let presenter = SplashPresenter()
    return SplashComposer(viewController: SplashVC(output: presenter))
  }
  
  private init(viewController: SplashVC) {
    self.viewController = viewController
  }
}

protocol SplashViewInput: class {}
protocol SplashViewOutput: class {}
