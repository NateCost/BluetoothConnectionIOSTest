//
//  Created by Ilya Sakalou on 10/18/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public class SpinnerView: UIView, Selectable {
  private let internalSpinner = UIActivityIndicatorView()
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    internalSpinner.translatesAutoresizingMaskIntoConstraints = false
    addSubview(internalSpinner)
    NSLayoutConstraint.activate([
      internalSpinner.widthAnchor.constraint(equalTo: widthAnchor),
      internalSpinner.heightAnchor.constraint(equalTo: heightAnchor),
      internalSpinner.centerXAnchor.constraint(equalTo: centerXAnchor),
      internalSpinner.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  public override func willMove(toSuperview newSuperview: UIView?) {
    super.willMove(toSuperview: newSuperview)
  }
  
  public func setState(_ state: ActivationState) {
    switch state {
      case .active:
        internalSpinner.alpha = 1.0
        internalSpinner.startAnimating()
      case .inactive:
        internalSpinner.alpha = 0.0
        internalSpinner.stopAnimating()
    }
  }
}
