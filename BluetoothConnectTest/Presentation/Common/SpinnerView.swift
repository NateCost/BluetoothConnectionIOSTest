//
//  Created by Ilya Sakalou on 10/18/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public protocol Spinner: class {
  func startSpinning()
  func stopSpinning()
}

public class SpinnerView: UIView, Spinner {
  public override func willMove(toSuperview newSuperview: UIView?) {
    super.willMove(toSuperview: newSuperview)
    backgroundColor = .black
  }
  
  public func startSpinning() {}
  
  public func stopSpinning() {}
}
