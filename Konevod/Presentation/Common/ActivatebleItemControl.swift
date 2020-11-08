//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public enum ActivationState {
  case inactive
  case active
}

public protocol Selectable {
  func setState(_ state: ActivationState)
  var tapAction: Handler? { get set }
}

public protocol ActivatableItem {
  func activate()
  var action: ((_ completion: Handler?) -> Void)? { get set }
  var state: ActivationState { get }
}

public class ActivatableItemControl: ActivatableItem {
  public var itemStateUpdateHandler: ((_ state: ActivationState) -> Void)?
  public var action: ((_ completion: Handler?) -> Void)?
  public var state: ActivationState = .inactive {
    didSet { itemStateUpdateHandler?(state) }
  }
  
  public init(itemStateUpdateHandler: ((_ state: ActivationState) -> Void)? = nil) {
    self.itemStateUpdateHandler = itemStateUpdateHandler
  }
  
  public func activate() {
    guard let action = action else { return }
    action(actionCompleted)
    state = .active
  }
  
  private func actionCompleted() {
    state = .inactive
  }
}
