//
//  Created by Ilya Sakalou on 11/3/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

final class CommonUIComponentsTest: XCTestCase {}
// MARK: - SelectionButtonTest
extension CommonUIComponentsTest {
  func testSelectableButtonDisableAutoresizingMask() {
    let sut = SelectableButton(frame: .zero)
    XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
  }
  
  func testSelectableButtonDisableAutoresizingMask2() {
    let sut = SelectableButton()
    XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
  }
  
  func testSelectionButtonActivatesOnTap() {
    let button = SelectableButton()
    let sut = ActivatableItemControl(item: button)
    sut.action = { _ in }
   
    button.sendActions(for: .touchUpInside)
    
    XCTAssertEqual(sut.state, .active)
  }
}
