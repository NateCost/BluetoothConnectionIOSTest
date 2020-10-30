//
//  Created by Ilya Sakalou on 10/24/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import UIKit

public enum SelectionState {
  case deselected
  case selected
}

public protocol MenuItem {
  func activate()
  var action: ((_ completion: Handler?) -> Void)? { get set }
  var state: SelectionState { get }
}

public class MenuItemControl<
  Item: Selectable
>: MenuItem where Item.State == SelectionState {
  private let item: Item
  public var state: SelectionState = .deselected {
    didSet { item.setState(state) }
  }
  public var action: ((_ completion: Handler?) -> Void)?
  
  public init(item: Item) {
    self.item = item
  }
  
  public func activate() {
    guard let action = action else { return }
    action(actionCompleted)
    state = .selected
  }
  
  private func actionCompleted() {
    state = .deselected
  }
}

public protocol Selectable {
  associatedtype State
  func setState(_ state: State)
}

final class SelectableButton: UIButton, Selectable {
  typealias State = SelectionState
  
  func setState(_ state: SelectionState) {
    
  }
}
