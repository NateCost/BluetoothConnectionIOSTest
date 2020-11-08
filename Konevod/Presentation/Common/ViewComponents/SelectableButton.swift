//
//  Created by Ilya Sakalou on 11/3/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

final class SelectableButton: UIButton, Selectable {
  typealias State = ActivationState
  
  func setState(_ state: ActivationState) {}
  var tapAction: Handler?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
  }
  
  @IBAction private func buttonDidTap() {
    tapAction?()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
