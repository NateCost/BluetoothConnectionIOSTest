//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public enum MenuItemState {
  case deselected
  case selected
}

public protocol MenuItem {
  func activate()
  var actionCompletion: Handler? { get set }
  var action: Handler? { get set }
  var state: MenuItemState { get }
}

public class MenuItemView: UIView, MenuItem {
  public var state: MenuItemState = .deselected
  public var actionCompletion: Handler?
  public var action: Handler?
  
  public func activate() {}
}
