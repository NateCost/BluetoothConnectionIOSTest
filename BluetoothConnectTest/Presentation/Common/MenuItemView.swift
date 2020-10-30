//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public enum MenuItemState {
  case deselected
  case selected
}

public protocol Selectable {
  func setState()
}

public protocol MenuItem {
  func activate()
  var action: ((_ completion: Handler?) -> Void)? { get set }
  var state: MenuItemState { get }
}

public class MenuItemControl: MenuItem {
  public var state: MenuItemState = .deselected
  public var action: ((_ completion: Handler?) -> Void)?
  
  public func activate() {
    guard let action = action else { return }
    action(actionCompleted)
    state = .selected
  }
  
  private func actionCompleted() {
    state = .deselected
  }
}
