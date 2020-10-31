//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public enum ActivationState {
  case inactive
  case active
}

public protocol ActivatableItem {
  func activate()
  var action: ((_ completion: Handler?) -> Void)? { get set }
  var state: ActivationState { get }
}

public class ActivatableItemControl<
  Item: Selectable
>: ActivatableItem where Item.State == ActivationState {
  private weak var item: Item?
  public var action: ((_ completion: Handler?) -> Void)?
  public var state: ActivationState = .inactive {
    didSet { item?.setState(state) }
  }
  
  public init(item: Item) {
    self.item = item
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

public protocol Selectable: class {
  associatedtype State
  func setState(_ state: State)
}

final class SelectableButton: UIButton, Selectable {
  typealias State = ActivationState
  
  func setState(_ state: ActivationState) {}
}
