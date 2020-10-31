//
//  Created by Ilya Sakalou on 10/18/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public class SpinnerView: UIView, Selectable {
  public override func willMove(toSuperview newSuperview: UIView?) {
    super.willMove(toSuperview: newSuperview)
    backgroundColor = .black
  }
  
  public func setState(_ state: ActivationState) {
    
  }
}
