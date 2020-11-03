//
//  Created by Ilya Sakalou on 11/3/20.
//  Copyright © 2020 Nirma Studio. All rights reserved.
//

import XCTest
@testable import BluetoothConnectTest

class CommonUIComponentsTest: XCTestCase {
  func testSelectableButtonDisableAutoresizingMask() {
    let sut = SelectableButton(frame: .zero)
    XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
  }
  
  func testSelectableButtonDisableAutoresizingMask2() {
    let sut = SelectableButton()
    XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
  }
}
